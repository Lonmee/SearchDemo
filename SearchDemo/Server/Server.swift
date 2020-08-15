//
//  Server.swift
//  SearchDemo
//
//  Created by Lonmee on 8/15/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation

fileprivate let webServer: GCDWebServer = GCDWebServer()

func startServer() -> Bool {
    webServer.addDefaultHandler(forMethod: "GET",
                                request: GCDWebServerRequest.self,
                                processBlock: {request in
                                    let html = "<html><body>To search <b>host/search?keyword</b></body></html>"
                                    return GCDWebServerDataResponse(html: html)
    })
    
    // service list
    addSearchService()
    
    return webServer.start(withPort: 8080, bonjourName: "GCD Web Server")
}

fileprivate func addSearchService() -> Void {
    webServer.addHandler(forMethod: "GET",
                         path: "/search",
                         request: GCDWebServerRequest.self,
                         asyncProcessBlock: {(request, completionBlock) in
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                                let kw = request.query?["kw"]
                                let data = kw == "Dyson" ? deserialize() : ""
                                let response = GCDWebServerDataResponse(text: data)
                                completionBlock(response)
                            }
    })
    
}
