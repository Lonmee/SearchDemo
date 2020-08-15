//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/15/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation
import SwiftHTTP

func searchReq(kw: String) -> Void {
    let url = "http://localhost:8080/search?kw=" + kw
    HTTP.GET(url) { response in
        if let err = response.error {
            print("error: \(err.localizedDescription)")
            return //also notify app of failure as needed
        }
        print("opt finished: \(response.description)")
    }
}
