//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/16/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftHTTP

func reqSearch(keyword: String, goodsData: GoodsData) {
    let kw = spaceTrimmer(str: keyword)
    if !kw.isEmpty {
        HTTP.GET("http://localhost:8080/search?kw=" + kw) { response in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                goodsData.data = response.data.isEmpty ? [] : serialize(response.data)
            }
        }
    }
}
