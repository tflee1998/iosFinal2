//
//  safariView.swift
//  iosFinal
//
//  Created by User02 on 2020/1/2.
//  Copyright © 2020 tflee. All rights reserved.
//

import SwiftUI
import SafariServices
struct safariView: View {
    // whether or not to show the Safari ViewController
    @State var name :String
    var body: some View {
       
        SafariView(url:URL(string: "https://www.youtube.com/results?search_query=\(self.name)highlight")!)
        
    }
}

struct safariView_Previews: PreviewProvider {
    static var previews: some View {
        safariView(name:"lakers")
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

