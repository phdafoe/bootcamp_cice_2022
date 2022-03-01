//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 22/2/22.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty {
                    MoviesPosterCarrousel(title: "Now Playing",
                                          moviesModel: self.viewModel.dataSourceNowPlaying,
                                          isPoster: false,
                                          isMovie: true)
                }
            }
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty {
                    MoviesPosterCarrousel(title: "Popular",
                                          moviesModel: self.viewModel.dataSourcePopular,
                                          isPoster: true,
                                          isMovie: true)
                }
            }
            Group{
                if !self.viewModel.dataSourceTopRate.isEmpty {
                    MoviesPosterCarrousel(title: "Top Rate",
                                          moviesModel: self.viewModel.dataSourceTopRate,
                                          isPoster: false,
                                          isMovie: true)
                }
            }
            Group{
                if !self.viewModel.dataSourceUpcoming.isEmpty {
                    MoviesPosterCarrousel(title: "UpComing",
                                          moviesModel: self.viewModel.dataSourceUpcoming,
                                          isPoster: true,
                                          isMovie: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
        
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
