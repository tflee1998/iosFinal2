//
//  TeamDetail.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct TeamDetail: View {
    var id:String
    @State var name=""
    @State var market=""
    @State var founded=0
    @State var venue:venue?
    @State var conference:conference?
    @State var division:division?
    @State var coachesName=""
    @State var coaches=[coach]()
    @State var players=[player]()
    func downloadResult(){
        let urlStr="https://api.sportradar.us/nba-t3/zh/teams/"+id+"/profile.json?api_key=ybweczu8fvfb249haydvuu3m"
        print(urlStr)
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data,response,error) in
                let decoder=JSONDecoder()
              do {
                    try decoder.decode(teamDetail.self,from:data!)
                } catch {
                    print("error", error)
                }
                
                if let data=data, let teamDetail = try?decoder.decode(teamDetail.self,from:data)
                {
            
                    self.name=teamDetail.name
                    self.market=teamDetail.market
                    self.founded=teamDetail.founded
                    self.coaches=teamDetail.coaches
                    self.coachesName=self.coaches[0].full_name
                    print("-------------------")
                    print(self.coaches[0].full_name)
                    self.players=teamDetail.players
                    print(self.players)
                }
            }.resume()
            
        }
    }
    var body: some View {
        VStack(alignment:.leading){
            Image(self.name).resizable().frame(width: 300, height: 300)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.yellow ,lineWidth:4))
                .shadow(radius: 40)
            Group{  Text("球隊名稱:\(self.name)")
                Text("\(self.market)")
                Text("創立於:\(self.founded)")
                Text("教練:\(self.coachesName)")
                Text("球員")
                ForEach(players,id: \.id)
                { (player) in
                    Text("\(player.full_name)")
                    
                }
                
            }
            
        }.navigationBarTitle("Team Detail").onAppear{
            self.downloadResult()
        }
    }
}

struct TeamDetail_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail(id: "583ecae2-fb46-11e1-82cb-f4ce4684ea4c")
    }
}
