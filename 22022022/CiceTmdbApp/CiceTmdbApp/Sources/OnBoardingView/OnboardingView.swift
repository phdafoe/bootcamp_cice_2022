//
//  OnboardingView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 2/3/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack{
            if currentPage == 1{
                ScreenView(image: "lottie1",
                           title: "Paso 1",
                           detail: "Bienvenidos a la App de Peliculas y Series paso 1",
                           bgColor: Color.white)
                    .transition(.scale)
            }
            if currentPage == 2{
                ScreenView(image: "lottie2",
                           title: "Paso 2",
                           detail: "Bienvenidos a la App de Peliculas y Series paso 2",
                           bgColor: Color.white)
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "lottie3",
                           title: "Paso 3",
                           detail: "Bienvenidos a la App de Peliculas y Series paso 3",
                           bgColor: Color.white)
                    .transition(.scale)
            }
        }
        .overlay(
            Button(action: {
                // Aqui cambiamos de pagina
                withAnimation(.easeInOut) {
                    if currentPage <= Constants.totalPages {
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(Constants.totalPages))
                                .stroke(Color.black, lineWidth: 3)
                                .rotationEffect(.degrees(-90))
                        }
                            .padding(-15)
                    )
            }).padding(.bottom, 20),
            
            alignment: .bottom
            
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                // Se muestra si solo es la primeta pagina
                if currentPage == 1 {
                    Text("Bienvenidos a la App de CiceTMDB")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }

                }
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                } label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }

            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.4)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            Spacer()
        }
        .background(bgColor.ignoresSafeArea())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
