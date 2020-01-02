//
//  ContentView.swift
//  iosFinal
//
//  Created by User14 on 2019/12/24.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView{
            Rank()
                .tabItem{
                    Image(systemName: "cloud.fill")
                    Text("Rank")
            }
            
            picker()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            
      }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

