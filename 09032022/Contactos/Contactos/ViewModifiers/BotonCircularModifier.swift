//
//  BotonCircularModifier.swift
//  Contactos
//
//  Created by TECDATA ENGINEERING on 10/3/22.
//

import SwiftUI

struct BotonCircularModifier: ViewModifier {
    
    var fontFamily: String?
    var fontSize: CGFloat?
    var foregroundColor: Color?
    var background: Color?
    var padding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding(padding ?? 20)
            .background(background ?? Color.gray)
            .clipShape(Circle())
            .foregroundColor(foregroundColor ?? .white)
            .font(.custom(fontFamily ?? "Arial", size: fontSize ?? 20))
            
    }
}

struct MyModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("AO")
            .modifier(BotonCircularModifier())
    }
}

extension View {
    func circularButton(fontFamily: String?,
                        fontSize: CGFloat?,
                        foregroundColor: Color?,
                        background: Color?,
                        padding: CGFloat?) -> some View {
        self.modifier(BotonCircularModifier(fontFamily: fontFamily,
                                            fontSize: fontSize,
                                            foregroundColor: foregroundColor,
                                            background: background,
                                            padding: padding))
    }
}
