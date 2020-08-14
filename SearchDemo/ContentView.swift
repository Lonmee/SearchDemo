//
//  ContentView.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var editing: Bool = false
    @State var keyword: String = ""
    let file = deserialize()
    
    var categories: [String: [Goods]] {
        Dictionary(
            grouping: goodsData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                InputBar(editing: $editing, keyword: $keyword)
                Form {
                    ForEach(categories.keys.sorted(by: >), id: \.self) { key in
                        Section (header: Text(key)
                            .foregroundColor(.gray)
                            .font(.subheadline)) {
                                ForEach(self.categories[key]!, id: \.self) {goods in
                                    HStack {
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(goods.mode)
                                                .font(.headline)
                                            Text(goods.stock ? "in-stock" : "Out-of-stock")
                                                .foregroundColor(.gray)
                                                .font(.caption)
                                        }
                                        Spacer()
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                                .fill(goods.stock ? Color.blue : Color.gray)
                                                .opacity(0.1)
                                                .frame(width:70, height: 24)
                                            Text("$\(String(goods.price))")
                                                .foregroundColor(goods.stock ? .blue : .gray)
                                                .font(.caption)
                                        }
                                    }
                                }
                        }
                    }
                }
                //                Text(file)
                Spacer()
            }
            .navigationBarTitle(Text("Search"))
            .navigationBarHidden(editing)
            .padding(.top, editing ? 14 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
