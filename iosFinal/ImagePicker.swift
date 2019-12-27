//
//  ImagePicker.swift
//  iosFinal
//
//  Created by User18 on 2019/12/25.
//  Copyright © 2019 tflee. All rights reserved.
//

import Foundation

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate=context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage=info[.originalImage] as? UIImage{
                parent.image=uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
            
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
