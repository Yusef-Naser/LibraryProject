//
//  ApiClient.swift
//  LibraryProject
//
//  Created by Yusef Naser on 22/01/2022.
//

import Foundation
import Alamofire

typealias CompletionHandler <T : Codable> = ( T? , AFError? , _ statusCode : Int  ) -> ()


//enum ResultApi<T:Decodable> {
//
//    case success(T)
//    case error(Error)
//}

class ApiClient <T : Decodable > {
    
    @discardableResult
    static public func performRequest(route:ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError> , _ statusCode : Int )->Void) -> DataRequest {
        return AF.request(route)
                .responseDecodable(decoder:decoder) {(response: DataResponse<  T , AFError >) in
#if DEBUG
                    if let data = response.data {
                        print("Response:/n\(String(describing: String(data: data, encoding: .utf8)))")
                    }
#endif
                    completion(response.result , response.response?.statusCode ?? -1 )
        }
    }
    
    
    @discardableResult
    static public func performRequestString(route:ApiRouter, completion:@escaping (AFDataResponse<String>)->Void) -> DataRequest {
        return AF.request(route).responseString(completionHandler: { (str) in
            completion(str)
            })
    }
    
    
//    static func performRequest (route:ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping ( ResultApi<T> , Int)->Void) {
//
//        let session = URLSession.shared
//        let request = route.asURLRequest()
//        let task = session.dataTask(with: request) { (data , response , error) in
//            DispatchQueue.main.async {
//                var statusCode = -1
//                if let httpResponse = response as? HTTPURLResponse {
//                    statusCode = httpResponse.statusCode
//                }
//                if let e = error {
//                    completion(.error(e ), statusCode)
//                    return
//                }
//                if let data = data {
//                    do{
//                        print(String(data: data , encoding: .utf8))
//                        let responseModel = try decoder.decode(T.self, from: data)
//                        completion(.success(responseModel), statusCode)
//                    }catch(let e){
//                        completion(.error(e ), statusCode)
//                    }
//                }
//            }
//
//        }
//        task.resume()
//    }
    
}
