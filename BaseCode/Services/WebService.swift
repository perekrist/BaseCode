//
//  WebService.swift
//  BaseCode
//

import SwiftUI
import Alamofire

let baseURL = ""

class WebService {
  
  static var shared: WebService = {
    let instance = WebService()
    return instance
  }()
  
  public func baseRequest<T: Decodable>(url: String,
                                        method: HTTPMethod,
                                        params: Parameters?,
                                        headers: HTTPHeaders,
                                        completion: @escaping (T) -> Void) {
    AF.request(url,
               method: method,
               parameters: params,
               encoding: JSONEncoding.default,
               headers: headers).responseData { response in
      switch response.result {
      case .success(let data):
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(T.self, from: data)
          completion(decodedData)
        } catch {
          Alert.shared.showAlert(error: error.localizedDescription)
          return
        }
      case .failure(let error):
        Alert.shared.showAlert(error: error.localizedDescription)
      }
    }
  }
}
