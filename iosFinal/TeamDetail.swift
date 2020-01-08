//
//  TeamDetail.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI
import SafariServices
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
    @State var urlString = URL(string:"")
    @State var search = ""
    func downloadResult(){
        let urlStr="https://api.sportradar.us/nba-t3/zh/teams/"+id+"/profile.json?api_key=ybweczu8fvfb249haydvuu3m"
       // print(urlStr)
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
                   // print("-------------------")
                  //  print(self.coaches[0].full_name)
                    self.players=teamDetail.players
                   // print(self.players)
                   
                }
                if self.name == "波士顿凯尔特人"
                {
                    self.search="nbaCeltics"
                }
                if self.name == "多伦多猛龙"
                {
                    self.search="nbaRaptors"
                }
                if self.name == "费城76人"
                {
                    self.search="nba76ers"
                }
                if self.name == "布鲁克林篮网"
                {
                    self.search="nbaNets"
                }
                if self.name == "纽约尼克斯"
                {
                    self.search="nbaKnicks"
                }
                if self.name == "密尔沃基雄鹿"
                {
                    self.search="nbaBucks"
                }

                if self.name == "印第安纳步行者"
                {
                    self.search="nbaPacers"
                }
                if self.name == "丹佛掘金"
                {
                    self.search="nbaNuggets"
                }
                if self.name == "犹他爵士"
                {
                    self.search="nbaJazz"
                }
                if self.name == "俄克拉荷马雷霆"
                {
                    self.search="nbaThunder"
                }
                if self.name == "波特兰开拓者"
                {
                    self.search="nbaTrailBlazer"
                }
                if self.name == "明尼苏达森林狼"
                {
                    self.search="nbaTimberwolves"
                }
                if self.name == "洛杉矶湖人"
                {
                    self.search="nbaLosAngelesLakers"
                }
                if self.name == "洛杉矶快船"
                {
                    self.search="clippers"
                }
                if self.name == "菲尼克斯太阳"
                {
                    self.search="phoenixSun"
                }
                if self.name == "萨克拉门托国王"
                {
                    self.search="nbaKings"
                }
                if self.name == "金州勇士"
                {
                    self.search="nbaWarriors"
                }
                if self.name == "休斯顿火箭"
                {
                    self.search="nbaRockets"
                }
                if self.name == "达拉斯 独行侠"
                {
                    self.search="nbaMaveriks"
                }
                if self.name == "圣安东尼奥马刺"
                {
                    self.search="nbaSpurs"
                }
                if self.name == "孟菲斯灰熊"
                {
                    self.search="nbaMemphis"
                }
                if self.name == "新奥尔良鹈鹕"
                {
                    self.search="nbaPelicans"
                }
                
            }.resume()
            
        }
    }
    @State var showSafari = false
   
    var body: some View {
        
        VStack(alignment:.leading){
           Image(self.name).resizable().frame(width: 300, height: 300)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.yellow ,lineWidth:4))
                .shadow(radius: 40).contextMenu{
                Button(action: {
                    self.showSafari = true

                }) {
                Text("比賽Highlight")
                 Image(systemName: "heart").imageScale(.small)
                }
                .sheet(isPresented: $showSafari) {
                   
                    safariView(name:self.search)
                }
            }
            HStack{
                VStack {
                    Group{
                    Text("球隊名稱:\(self.name)").bold().foregroundColor(Color.red)
                    Text("\(self.market)")
                    Text("創立於:\(self.founded)")
                    Text("教練:\(self.coachesName)").bold().foregroundColor(Color.blue)
                    Text("球員").bold().foregroundColor(Color.red)
                    ForEach(players,id: \.id)
                    { (player) in
                        Text("\(player.full_name)")
                        
                    }
                    
                    }
                }
            AnimationsView(name:"cup").frame(width:100, height:350)
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


