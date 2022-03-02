//
//  DetailPersonPopular.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 2/3/22.
//

import SwiftUI

struct DetailPersonPopular: View {
    
    let dataModel: [KnownForViewModel]
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        .padding(.horizontal, 8)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        //.padding(.bottom, 100)
    }
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            HStack{
                Button {
                    self.presenterMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()

            }
            .foregroundColor(.red)
        }
    }
    
    var bodyView: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(self.dataModel) { item in
                if item.originalTitle != nil{
                    Text(item.originalTitle ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    PersonDetailImage(model: item)
                    HStack{
                        Text(item.yearText)
                        Spacer()
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                    }
                    Text(item.overview ?? "")
                        .font(.title3)
                }
            }
        }
        .padding(.bottom, 100)
    }
}

struct PersonDetailImage: View {
    
    let person: KnownForViewModel
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: KnownForViewModel){
        self.person = model
        self.imageLoaderVM.loadImage(whit: self.person.posterUrl)
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
    }
}

struct DetailPersonPopular_Previews: PreviewProvider {
    static var previews: some View {
        DetailPersonPopular(dataModel: [KnownForViewModel(id: 0,
                                                          overview: "The early life of child genius Sheldon Cooper, later seen in The Big Bang Theory.",
                                                          posterPath: "/5Gf83qYgLY8Qivn7jpv5nxxZPu6.jpg",
                                                          voteAverage: 8,
                                                          originalTitle: "Young Sheldon",
                                                          releaseDate: "2020-09-10")])
    }
}
