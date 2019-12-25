//
//  ContentView.swift
//  iosFinal
//
//  Created by User14 on 2019/12/24.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State  var result:rankArr
    func downloadTeamResult(){
        print("hi")
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
                    self.result=rankArr
                    
                }
            }.resume()
            
        }
    }
    
    
    
    var body: some View {
        
        Text("Hello World")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

