//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/15/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation

func searchReq(kw: String) -> void {
    HTTP.GET("https://google.com") { response in
        if let err = response.error {
            print("error: \(err.localizedDescription)")
            return //also notify app of failure as needed
        }
        print("opt finished: \(response.description)")
        //print("data is: \(response.data)") access the response of the data with response.data
    }
}
