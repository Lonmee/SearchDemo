//
//  ContentView.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var editing: Bool = false
    @State private var keyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .frame(height: 38)
                        .opacity(0.05)
                    
                    HStack {
                        if (keyword.isEmpty) {
                            Image(systemName: "magnifyingglass")
                                .opacity(0.3)
                                .imageScale(.medium)
                                .padding(.leading, 10)
                                .accessibility(label: Text("Search icon"))
                        }
                        
                        TextField("Tap here to search", text: $keyword, onEditingChanged: { editing in
                            withAnimation(.easeInOut(duration: 0.1)) {
                                self.editing = editing
                            }
                        }) {
                            print("committed: \(self.keyword)")
                        }
                        .padding(.leading, keyword.isEmpty ? 0 : 12)
                        
                        if (!keyword.isEmpty) {
                            Image(systemName: "clear")
                                .opacity(0.3)
                                .imageScale(.medium)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    self.keyword = ""
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarTitle(Text("Search"))
            .padding(.top, editing ? 14 : 0)
            .navigationBarHidden(editing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 pro Max"], id: \.self) { deviceName in
            ContentView()
        }
    }
}
