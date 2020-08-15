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
    @State var noResult: Bool = false
    @State var keyword: String = ""
    
    let bg: some View = Rectangle()
        .fill(Color(red: 0.5, green: 0.5, blue: 0.5))
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                InputBar(editing: $editing, keyword: $keyword, noResult: $noResult)
                
                if (goodsData.data.isEmpty && noResult) {
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
            .padding(.top, editing ? 80 : 6)
        }
        .onAppear() {
            if (startServer()) {
                print("Search_server comes online")
            }
        }
        .padding(.top, editing ? -180 : 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GoodsData())
    }
}
