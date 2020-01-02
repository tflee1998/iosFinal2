//
//  basketballAnime.swift
//  iosFinal
//
//  Created by User18 on 2019/12/25.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI
import Lottie

struct basketballAnime: View {
    var img=["ball","shootMake"]
    @State var make=0
    @State private var half = false
    @State private var dim = false
    @State private var showIn=false
    
    
    var body: some View {
        
        VStack{
            Image(img[make])
                .resizable()
                .frame(width: 500, height: 400)
                .scaleEffect(half ? 1.0 : 0.5)
                .opacity(dim ? 1.0 : 0.6)
                .animation(.easeInOut(duration: 1.0))
                .onTapGesture {
                    self.dim.toggle()
                    self.half.toggle()
                    self.showIn.toggle()
                    if self.showIn==true{
                        self.make=1
                    }
                    else
                    {
                        self.make=0
                    }
            }
            
            
        }}
    
}

struct basketballAnime_Previews: PreviewProvider {
    static var previews: some View {
        basketballAnime()
    }
}
