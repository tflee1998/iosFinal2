//
//  imagePicker.swift
//  iosFinal
//
//  Created by User02 on 2019/12/27.
//  Copyright © 2019 tflee. All rights reserved.
//

import SwiftUI

struct imagePicker: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    var body: some View {
    NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)

                    // display the image
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                   self.showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                    Slider(value: self.$filterIntensity)
                }.padding(.vertical)

                HStack {
                    Button("Change Filter") {
                        // change filter
                    }

                    Spacer()

                    Button("Save") {
                        // save the picture
                    }
                }
            }
            .padding([.leading, .bottom, .trailing])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: self.loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        }
    }
}
    struct imagePicker_Previews: PreviewProvider {
        static var previews: some View {
            imagePicker()
        }
}
