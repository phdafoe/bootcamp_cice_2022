//
//  CustomBodyMainView.swift
//  FashionApp
//
//  Created by TECDATA ENGINEERING on 21/2/22.
//

import SwiftUI

struct CustomBodyMainView: View {
    
    @State private var dressSelected = "Dress"
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    //
                }) {
                    HStack{
                        Text("Casual Dress").font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down").font(.title3)
                    }
                }
                .foregroundColor(.black)
                
                Button(action: {
                    //
                }) {
                    HStack{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                .foregroundColor(.black)
                .contextMenu {
                    Button {
                        //
                    } label: {
                        Text("Menu item 1")
                    }
                    Button {
                        //
                    } label: {
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("navega a nueva vistas")
                        }
                    }
                    Text("Menu item 3")
                }
            }
            .padding(.horizontal, 8)
            
            HStack{
                ForEach(typesDresses, id: \.self) { item in
                    HStack{
                        Button {
                            self.dressSelected = item
                        } label: {
                            Text(item)
                                .font(.system(size: 8, weight: .semibold, design: .default))
                                .padding()
                        }
                        .foregroundColor(self.dressSelected == item ? .white : .black)
                        .background(self.dressSelected == item ? Color.black : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            
            detailLazyGridScrollView
        }
    }
    
    var detailLazyGridScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(customData) { item in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(item.myRows) { itemRow in
                        CardCell(model: itemRow)
                    }
                }
            }
        }
    }
}

struct CardCell: View {
    var model: Row
    var body: some View {
        VStack(spacing: 20){
            Image(self.model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text(self.model.name)
                        .font(.callout)
                        .lineLimit(1)
                    Text(self.model.price)
                        .fontWeight(.semibold)
                }
                Spacer()
                Button {
                    // Nada
                } label: {
                    Image("option")
                        .renderingMode(.original)
                }
                .padding(.trailing, 10)
            }
        }
    }
}


struct CustomBodyMainView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBodyMainView()
    }
}


// MARK: - DataModel

struct CustomType: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable {
    var id: Int
    var name: String
    var image: String
    var price: String
}

var customSize = ["S", "M", "L", "XL"]
var typesDresses = ["Dress", "Pants", "Blazers", "Jackets"]
var customData = [CustomType(id: 0,
                             myRows: [Row(id: 0, name: "Fit and Flare", image: "p1", price: "€ 199"),
                                      Row(id: 1, name: "Fit and Summer", image: "p21", price: "€ 299"),
                                      Row(id: 2, name: "Empire and Flare", image: "p12", price: "€ 399"),
                                      Row(id: 3, name: "Fit and Vibes", image: "p22", price: "€ 499"),
                                      Row(id: 4, name: "Empire and Flare", image: "p1", price: "€ 599"),
                                      Row(id: 5, name: "Fit and Empire", image: "p12", price: "€ 699")])]
