//
//  SubContentView.swift
//  poc-traffic-app-ui
//
//  Created by Masahiko Yagi on 2019/07/10.
//  Copyright © 2019 Masahiko Yagi. All rights reserved.
//

import SwiftUI

struct SubContentView : View {
    
    var body: some View {
        
        List(0...4){ num in
            Text("Test\(num)")
        }
    }
}

#if DEBUG
struct SubContentView_Previews : PreviewProvider {
    static var previews: some View {
        SubContentView()
    }
}
#endif
