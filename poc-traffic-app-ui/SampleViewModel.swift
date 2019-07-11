//
//  SampleViewModel.swift
//  poc-traffic-app-ui
//
//  Created by Masahiko Yagi on 2019/07/10.
//  Copyright © 2019 Masahiko Yagi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class SampleViewModel: BindableObject {
    
    let didChange = PassthroughSubject<SampleViewModel, Never>()
    
    init(){
        let url: String = "http://localhost:8080/api/v2/department/acquisition?"
        
        SampleService().connectAPI(url: url) { data in
            if let data = data {
                self.data = data.map(SampleDataModel.init)
            }
        }
    }
    
    var data = [SampleDataModel]() {
        didSet {
            didChange.send(self)
        }
    }
}


