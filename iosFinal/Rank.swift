//
//  Rank.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct Rank: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black,Color.red,Color.black]), startPoint: UnitPoint(x:0,y:0), endPoint: UnitPoint(x:1,y:1))
                VStack{
                    NavigationLink(destination: WesternView())
                    {
                        Image("Western")
                            .renderingMode(.original)
                            .resizable().frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.yellow ,lineWidth:4))
                        .shadow(radius: 40)
                        
                    }
                    NavigationLink(destination: EasternView())
                    {
                        Image("Eastern")
                            .renderingMode(.original)
                            .resizable().frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.yellow ,lineWidth:4))
                        .shadow(radius: 40)
                    }
                }
            }
        }
    }
}

struct Rank_Previews: PreviewProvider {
    static var previews: some View {
        Rank()
    }
}
