//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MoviesCoordinator.navigation()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
