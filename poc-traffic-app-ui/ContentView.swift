//
//  ContentView.swift
//  poc-traffic-app-ui
//
//  Created by Masahiko Yagi on 2019/07/10.
//  Copyright © 2019 Masahiko Yagi. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding var viewModel: SampleViewModel
    
    var body: some View {
        VStack {
            List(viewModel.data) { item in
                VStack {
                    Text(item.depid)
                        .lineLimit(nil)

                    Text(item.depname)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
            }
            
            NavigationView {
                NavigationButton(destination: SubContentView()) {
                    Text("Show Next")
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
#endif
