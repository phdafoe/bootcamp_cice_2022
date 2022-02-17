//
//  ContentView.swift
//  FashionApp
//
//  Created by TECDATA ENGINEERING on 17/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponentes()
            Text("Hola Mundo!")
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
