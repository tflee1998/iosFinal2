//
//  EasternView.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct EasternView: View {
    
    @State var Eastern=[teams]()
    func downloadTeamResult(){
        let urlStr="https://api.sportradar.us/nba-t3/zh/seasontd/2019/REG/rankings.json?api_key=ybweczu8fvfb249haydvuu3m"
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data,response,error) in
                let decoder=JSONDecoder()
                /* do {
                    try decoder.decode(rankArr.self,from:data!)
                } catch {
                    print("error", error)
                }*/
                
                if let data=data, let rankArr = try?decoder.decode(rankArr.self,from:data)
                {
                    self.Eastern=rankArr.conferences[0].divisions[0].teams
                    self.Eastern+=rankArr.conferences[0].divisions[1].teams
                    self.Eastern+=rankArr.conferences[0].divisions[2].teams

                    
                }
            }.resume()
            
        }
    }
    
    
    
    var body: some View {
        

            List(Eastern.indices, id: \.self) { (index)  in
                NavigationLink(destination:TeamDetail(id:self.Eastern[index].id))
                {
                    
                    TeamRow(team: self.Eastern[index]).onAppear{
                        UITableView.appearance().separatorColor = .clear
                    }
                }
            }.navigationBarTitle("Eastern Conference")
            .onAppear {
                self.downloadTeamResult()
            }
            
        }
        
    
    
}

struct EasternView_Previews: PreviewProvider {
    static var previews: some View {
        EasternView()
    }
}
