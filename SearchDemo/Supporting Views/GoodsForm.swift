//
//  GoodsForm.swift
//  SearchDemo
//
//  Created by Lonmee on 8/14/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct GoodsForm: View {
    let preview: Bool
    @EnvironmentObject var goodsData: GoodsData
    
    init() {
        self.preview = false
    }
    
    init(preview: Bool) {
        self.preview = preview
    }
    
    // MARK: mock data for dev
    var categories: [String: [Goods]] {
        let data = preview ? mockGoodsData : goodsData.data
        return data.isEmpty ? [:] : Dictionary(
            grouping: data,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        Form {
            ForEach(categories.keys.sorted(by: >), id: \.self) { key in
                // MARK: Section with default gap between each other
                Section (header: Text(key)
                    .font(.subheadline)
                    .fontWeight(.medium)) {
                        ForEach(self.categories[key]!, id: \.self) {goods in
                            HStack {
                                // MARK: mode & stock
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(goods.mode)
                                        .font(.headline)
                                    Text(goods.stock ? "in-stock" : "Out-of-stock")
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                }
                                .frame(height: 44, alignment: .center)
                                Spacer()
                                // MARK: prick
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10, style: .circular)
                                        .fill(goods.stock ? Color.blue : Color.gray)
                                        .opacity(0.1)
                                        .frame(width:70, height: 24)
                                    Text("$\(String(goods.price))")
                                        .foregroundColor(goods.stock ? .blue : .gray)
                                        .opacity(0.9)
                                        .font(.caption)
                                }
                            }
                        }
                }
            }
        }
    }
}

struct GoodsForm_Previews: PreviewProvider {
    static var previews: some View {
        GoodsForm(preview: true)
            .environmentObject(GoodsData())
    }
}
