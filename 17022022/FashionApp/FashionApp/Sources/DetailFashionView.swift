//
//  DetailFashionView.swift
//  FashionApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    @State private var showCustomAlertView = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    headerInformation
                    bodyInformation
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if showCustomAlertView {
                CustomAlertView(title: "Enhorabuena!",
                                message: "Tu seleccion se ha añadido al carrito de compras",
                                hideCustomAlertView: self.$showCustomAlertView)
                    
            }
        }
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                GeometryReader{ proxy in
                    Button {
                        self.presenterMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top], 10)
                    
                                        
                    Button {
                        self.showAlert.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    .alert(isPresented: self.$showAlert) {
                        Alert(title: Text("Hola soy una Alert en SwiftUI"),
                              message: Text("Aqui estamos aprendiendo como se hace una Alerta en SwiftUI"),
                              primaryButton: .default(Text("OK"),
                                                      action: {
                            // Aqui se hacen las acciones
                        }),
                              secondaryButton: .cancel(Text("Cancel"), action: {
                            // Aqui se hacen las acciones
                        }))
                    }
                    
                    Button {
                        self.showActionSheet.toggle()
                    } label: {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)
                    .actionSheet(isPresented: self.$showActionSheet) {
                            ActionSheet(title: Text("A question"), message: Text("Are you sure about that?"), buttons: [
                                .default(Text("Yes")) { /* Pressed button Yes. Do Something */ },
                                .default(Text("No")) { /* Pressed button No. Do Something */ },
                                .default(Text("Maybe")) { /* Pressed button Maybe. Do Something */ },
                                .destructive(Text("Delete")) { /* Pressed button Delete. Do Something */ },
                                .cancel()  { /* Pressed button Cancel. Do Something */ }
                            ])
                    }
                }
            }
            .foregroundColor(.black)
        }
    }
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack{
                    Text(model.name)
                        .font(.largeTitle)
                    Text(model.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20){
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .font(.headline)
            
            Text("Select Size")
                .font(.largeTitle)
            HStack{
                ForEach(customSize, id: \.self){ item in
                    Button {
                        self.mySize = item
                    } label: {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    }
                    .foregroundColor(.black)

                }
            }
            
            HStack{
                Button {
                    // Aqui va la accion
                } label: {
                    Text("Add to cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    self.showCustomAlertView.toggle()
                } label: {
                    Text("Buy now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
                

            }
        }
        .padding()
        .background(
            roudedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -30)
        )
        .padding(.top, -40)
        
    }
}

struct roudedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0,
                                     name: "Summer and Flares",
                                     image: "p1",
                                     price: "199 €"))
    }
}
