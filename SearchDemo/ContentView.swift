//
//  ContentView.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var goodsData: GoodsData
    @State var editing: Bool = false
    @State var keyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Color.init(.sRGB, red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                        .frame(height: 58)
                    InputBar(editing: $editing, keyword: $keyword)
                }
                
                if (goodsData.data.isEmpty && !keyword.isEmpty) {
                    ZStack{
                        Rectangle()
                            .fill(Color.init(.sRGB, red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                        VStack {
                            Text("No result")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding(.top, 60)
                            GoodsForm()
                            Spacer()
                        }
                    }
                } else {
                    GoodsForm()
                }
            }
            .navigationBarTitle(Text("Search"))
            .padding(.top, editing ? 80 : 6)
        }
        .padding(.top, editing ? -180 : 0)
        .onTapGesture {
            // TODO: keyboard dismiss optional
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GoodsData())
    }
}
