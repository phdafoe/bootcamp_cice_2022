//
//  FashionView.swift
//  FashionApp
//
//  Created by TECDATA ENGINEERING on 21/2/22.
//

import SwiftUI

struct FashionView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        ZStack{
            VStack{
                CustomNavigationView(showAlertTres: self.$showCustomAlertView)
                CustomBodyMainView()
            }
            .blur(radius: self.showCustomAlertView ? 3 : 0)
            .animation(.easeInOut, value: self.showCustomAlertView)
            
            if showCustomAlertView {
                CustomAlertView(title: "Esta es una Custom Alert View",
                                message: "Esta es una alerta personalizada y se colocará encima de la vista principal y se añadirá un efecto de blur y el fonod medio opaco",
                                hideCustomAlertView: self.$showCustomAlertView)
                    
            }
        }
    }
    
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}
