//
//  PeopleCarrousel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 2/3/22.
//

import SwiftUI

struct PeopleCarrousel: View {
    
    let title: String
    let dataModel: [PeopleViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack{
                Text(title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.red.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                ForEach(self.dataModel){ item in
                    NavigationLink {
                        DetailPersonPopular(dataModel: item.knownFor ?? [])
                    } label: {
                        PeopleCell(model: item)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct PeopleCell: View {
    
    let model: PeopleViewModel
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: PeopleViewModel){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.profilePathUrl)
    }
    
    var body: some View {
        ZStack{
            if self.imageLoaderVM.image != nil {
                VStack{
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text(self.model.name ?? "")
                        .font(.headline)
                }
            } else {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                         startPoint: .bottom,
                                         endPoint: .top))
                    .clipShape(Circle())
            }
        }
    }
}


//struct PeopleCarrousel_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleCarrousel(title: "",
//                        dataModel: PeoplePopularServerModel.stubbedPeoplePopular?.results)
//    }
//}
