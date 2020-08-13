//
//  Test.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct InputBar: View {
    @Binding var editing: Bool
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color.gray)
                .opacity(0.2)
                .frame(height: 38)
            HStack {
                if (keyword.isEmpty) {
                    Image(systemName: "magnifyingglass")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .accessibility(label: Text("Search icon"))
                }
                
                TextField("Tap here to search", text: $keyword, onEditingChanged: { editing in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        self.editing = editing
                    }
                }) {
                    print("committed: \(self.keyword)")
                }
                
                if (!keyword.isEmpty) {
                    Image(systemName: "clear")
                        .opacity(0.3)
                        .imageScale(.medium)
                        .onTapGesture {
                            self.keyword = ""
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}
