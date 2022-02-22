//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack{
            Text("2")
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }
        
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesViewModel())
    }
}
