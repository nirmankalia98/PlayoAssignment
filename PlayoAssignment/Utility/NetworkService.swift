//
//  NetworkService.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import Foundation

struct NetworkService{
    
    static let shared = NetworkService()
    
    private init(){}
    
    //Ideally would have returned 'Result' to show error messages on different event but since it's a assignment returning a Optional
    
    func fetchData<T: Codable>(type: T.Type,url: URL,completion: @escaping (T?)->Void){
        URLSession.shared.dataTask(with: url){data, response, error in
            
            if let data = data,let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                
                do {
                    let res = try JSONDecoder().decode(T.self, from: data)
                    completion(res)
                } catch {
                    print("❌",#file,#function,#line,error.localizedDescription)
                    completion(nil)
                }
                
            }else if let error = error{
                print("❌",#file,#function,#line,error.localizedDescription)
                completion(nil)
            }else{
                print("❌",#file,#function,#line,"unspecific error",response.debugDescription)
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
