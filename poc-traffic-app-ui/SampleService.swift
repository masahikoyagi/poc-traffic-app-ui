//
//  SampleService.swift
//  poc-traffic-app-ui
//
//  Created by Masahiko Yagi on 2019/07/10.
//  Copyright © 2019 Masahiko Yagi. All rights reserved.
//

import Foundation

class SampleService {
    
    func connectAPI(url: String, completion: @escaping ([SampleData]?) -> ()) {
        
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
//        let res = httpRequest(request: urlRequest)
//        let response = try? JSONDecoder().decode([SampleData].self, from: res.data)
//        if let response = response {
//            DispatchQueue.main.async {
//                completion(response)
//            }
//        }
        completion([SampleData]())
    }
    
    /// http 通信を行う
    ///
    /// - Parameter request: 送信する設定等
    /// - Returns: レスポンスデータ
    func httpRequest(request:URLRequest) -> (data:Data, response:URLResponse){
        let semaphore = DispatchSemaphore(value: 0)
        var returnData = Data()
        var returnResponse = URLResponse()
        
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            if let data = data{
                returnData = data
                returnResponse = response!
                semaphore.signal()
            }
        }
        
        task.resume()
        
        // タイムアウト指定
        switch semaphore.wait(wallTimeout: .now() + 60) {
        case .timedOut:
            return (Data(), URLResponse())
        default:
            break
        }
        
        return (returnData, returnResponse)
    }
}
