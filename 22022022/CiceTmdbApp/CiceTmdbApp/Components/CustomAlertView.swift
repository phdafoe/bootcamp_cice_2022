//
//  CustomAlertView.swift
//  FashionApp
//
//  Created by TECDATA ENGINEERING on 21/2/22.
//

import SwiftUI

struct CustomAlertView: View {
    
    var title: String
    var message: String
    var imageURL: URL
    var hideCustomAlertView: Binding<Bool>
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(title: String,
         message: String,
         imageURL: URL,
         hide: Binding<Bool>) {
        self.title = title
        self.message = message
        self.imageURL = imageURL
        self.hideCustomAlertView = hide
        self.imageLoaderVM.loadImage(whit: self.imageURL)
    }
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        // Aqui va la accion del Binding
                        self.hideCustomAlertView.wrappedValue = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 18))
                
                if self.imageLoaderVM.image != nil{
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .shadow(radius: 10)
                        .overlay(
                            Circle()
                                .stroke(Color.red, lineWidth: 1)
                        )
                        .loader(state: .ok)
                } else {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .clipShape(Circle())
                        .loader(state: .loading)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            
        }
    }
}


