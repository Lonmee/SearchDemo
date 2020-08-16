//
//  Test.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct InputBar: View {
    @EnvironmentObject var goodsData: GoodsData
    
    @Binding var editing: Bool
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            // MARK: bg
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color.init(red: 244 / 255, green: 244 / 255, blue: 244 / 255))
                .frame(height: 38)
            
            // MARK: input area
            HStack {
                // MARK: btn magnifying
                if (keyword.isEmpty) {
                    Image(systemName: "magnifyingglass")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .accessibility(label: Text("Search icon"))
                }
                // MARK: input field
                TextField("Tap here to search", text: Binding<String>(
                get: { self.keyword },
                set: {
                    self.keyword = $0
                    reqSearch(keyword: self.keyword, goodsData: self.goodsData)
                }),
                // MARK: focus handler
                onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: 0.4)) {
                        self.editing = editing
                    }
                })
                // MARK: btn clear
                if (!keyword.isEmpty) {
                    Image(systemName: "clear")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .onTapGesture {
                            self.keyword = ""
                            self.goodsData.data = []
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}
