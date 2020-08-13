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
    
    var body: some View {
        NavigationView {
            VStack {
                InputBar(editing: $editing, keyword: $keyword)
                
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
