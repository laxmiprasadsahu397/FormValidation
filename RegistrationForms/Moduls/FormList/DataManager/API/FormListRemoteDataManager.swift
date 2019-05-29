//
//  FormListRemoteDataManager.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class FormListRemoteDataManager: FormListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: FormListRemoteDataManagerOutputProtocol?
    
    func retrieveFormList() {
        guard let url = URL(string: "") else {
            return
        }
        Alamofire.request( url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.response!.statusCode == 200 {
                    if response.result.value != nil{
                        print("response : \(String(describing: String(data: response.data!, encoding: .utf8)))")
                        let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String : Any]
                    }
                } else {
                     print("Failure : \(String(describing: response.result.error))")
                    self.remoteRequestHandler?.onError()
                }
                break
                
            case .failure(_):
                 print("Failure : \(String(describing: response.result.error))")
                self.remoteRequestHandler?.onError()
                break
                
            }
        }
    }
}
