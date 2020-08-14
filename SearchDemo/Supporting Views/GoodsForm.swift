//
//  GoodsForm.swift
//  SearchDemo
//
//  Created by Lonmee on 8/14/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct GoodsForm: View {
    
    var categories: [String: [Goods]] {
        goodsData.isEmpty ? [:] :
            Dictionary(
                grouping: goodsData,
                by: { $0.category.rawValue }
        )
    }
    
    // FIXME: Section with header will increase height
    var body: some View {
        Form {
            ForEach(categories.keys.sorted(by: >), id: \.self) { key in
                Section (header: Text(key)
                    .font(.subheadline)
                    .fontWeight(.medium)) {
                            ForEach(self.categories[key]!, id: \.self) {goods in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(goods.mode)
                                            .font(.headline)
                                        Text(goods.stock ? "in-stock" : "Out-of-stock")
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                    }
                                    .frame(height: 44, alignment: .center)
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
    }
}

struct GoodsForm_Previews: PreviewProvider {
    static var previews: some View {
        GoodsForm()
    }
}
