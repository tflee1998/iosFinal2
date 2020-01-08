//
//  TeamRow.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct TeamRow: View {
    
    var team:teams
    @State var showSafari = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue,Color.yellow,Color.red]), startPoint: UnitPoint(x:0,y:0), endPoint: UnitPoint(x:1,y:1))
            HStack{
                VStack(alignment: .leading) {
                    Image(team.name).resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black ,lineWidth:4))
                    .shadow(radius: 50)
                    .frame(width: 100, height: 100)
                    Text("  \(team.name)")
                    Text("  \(team.market)")
                }
                Spacer()     
                VStack(alignment:.leading){
                    HStack {
                        Text("Conference rank:")
                        Image(systemName: "\(team.rank.conference).circle").imageScale(.large)
                    }
                    HStack {
                        Text("Division rank:")
                        Image(systemName: "\(team.rank.division).circle.fill").imageScale(.large)
                    }
                    
                }
            
        }
            }.cornerRadius(20).shadow(radius: 5)
}
}

struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(team: teams(id:" ",name:"Lakers",market:"Los Angeles",rank: rank(conference: 1, division: 2)))
    }
}
