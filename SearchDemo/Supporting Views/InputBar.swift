//
//  Test.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI
import SwiftHTTP

struct InputBar: View {
    @EnvironmentObject var goodsData: GoodsData
    
    @Binding var editing: Bool
    @Binding var keyword: String
    @Binding var noResult: Bool
    
    fileprivate func reqSearch() {
        let kw = spaceTrimmer(str: self.keyword)
        if !kw.isEmpty {
            HTTP.GET("http://localhost:8080/search?kw=" + kw) { response in
                if response.data.isEmpty {
                    self.noResult = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.goodsData.data = response.data.isEmpty ? [] : serialize(response.data)
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color.gray)
                .opacity(0.1)
                .frame(height: 38, alignment: .center)
            HStack {
                if (keyword.isEmpty) {
                    Image(systemName: "magnifyingglass")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .accessibility(label: Text("Search icon"))
                }
                
                TextField("Tap here to search", text: Binding<String>(
                get: { self.keyword },
                set: {
                    self.keyword = $0
                    self.reqSearch()
                }),
                onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: 0.4)) {
                        self.editing = editing
                    }
                }) {
                    self.reqSearch()
                }
                
                if (!keyword.isEmpty) {
                    Image(systemName: "clear")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .onTapGesture {
                            self.keyword = ""
                            self.noResult = false
                            self.goodsData.data = []
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}
