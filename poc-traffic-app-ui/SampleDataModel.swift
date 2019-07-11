//
//  SampleDataModel.swift
//  poc-traffic-app-ui
//
//  Created by Masahiko Yagi on 2019/07/10.
//  Copyright © 2019 Masahiko Yagi. All rights reserved.
//

import Foundation
import SwiftUI

class SampleDataModel: Identifiable {
    
    let id = UUID()
    
    let sample: SampleData
    
    init(sample: SampleData){
        self.sample = sample
    }
    
    var depid: String {
        return self.sample.departmentId ??  ""
    }
    
    var depname: String {
        return self.sample.departmentName ??  ""
    }
}
