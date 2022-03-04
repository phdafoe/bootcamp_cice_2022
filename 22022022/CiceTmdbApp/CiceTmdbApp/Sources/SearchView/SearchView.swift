/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBarView(placeholder: "Search movie", text: self.$viewModel.query)
            if self.viewModel.dataSourceSearchMovie != nil && !(self.viewModel.dataSourceSearchMovie?.isEmpty ?? false){
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(self.viewModel.dataSourceSearchMovie!) { movie in
                        NavigationLink {
                            DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataId: movie.id ?? 0))
                        } label: {
                            MoviePosterCell(model: movie, isPoster: true)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            } else {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.red, lineWidth: 2)
                    )
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
