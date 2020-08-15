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
    
    let bg: some View = Rectangle()
        .fill(Color(red: 0.5, green: 0.5, blue: 0.5))
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                InputBar(editing: $editing, keyword: $keyword)
                
                if (goodsData.data.isEmpty) {
                    Text("No result")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.top, 60)
                    Spacer()
                } else {
                    GoodsForm()
                }
            }
            .navigationBarTitle(Text("Search"))
            .navigationBarHidden(editing)
            .padding(.top, editing ? 14 : 0)
        }
        .onAppear() {
            if (startServer()) {
                print("Search_server comes online")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GoodsData())
    }
}
