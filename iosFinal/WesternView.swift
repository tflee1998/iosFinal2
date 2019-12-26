//
//  WesternView.swift
//  iosFinal
//
//  Created by User02 on 2019/12/26.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct WesternView: View{
    
    @State var Western=[teams]()
    func downloadTeamResult(){
        let urlStr="https://api.sportradar.us/nba-t3/zh/seasontd/2019/REG/rankings.json?api_key=ybweczu8fvfb249haydvuu3m"
        
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url) { (data,response,error) in
                let decoder=JSONDecoder()
            
                if let data=data, let rankArr = try?decoder.decode(rankArr.self,from:data)
                {
                    self.Western=rankArr.conferences[1].divisions[0].teams
                    self.Western+=rankArr.conferences[1].divisions[1].teams
                    self.Western+=rankArr.conferences[1].divisions[2].teams
                    
                }
            }.resume()
            
        }
    }
    
    
    
    var body: some View {
           
  
               List(Western.indices, id: \.self) { (index)  in
                   NavigationLink(destination:TeamDetail(id:self.Western[index].id))
                   {
                       
                       TeamRow(team: self.Western[index])
                   }
               }.navigationBarTitle("Western Conference")
               .onAppear {
                   self.downloadTeamResult()
               }
               
           }
           
       
       
    
}

struct WesternView_Previews: PreviewProvider {
    static var previews: some View {
        WesternView()
    }
}
