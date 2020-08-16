//
//  ContentView.swift
//  SearchDemo
//
//  Created by Lonmee on 8/13/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var goodsData: GoodsData
    @State var editing: Bool = false
    @State var keyword: String = ""
    
    let keyboardUitls = NotificationUitls()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                InputBar(editing: $editing, keyword: $keyword)
                
                if (goodsData.data.isEmpty && !keyword.isEmpty) {
                    Text("No result")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.top, 60)
                    Spacer()
                } else {
                    GoodsForm()
                }
            }
            .navigationBarTitle(Text("Search"))
            .padding(.top, editing ? 80 : 6)
        }
        .padding(.top, editing ? -180 : 0)
        .onTapGesture {
            // TODO: keyboard dismiss optional
            print("tapped")
        }
        .onAppear {
            // 监听键盘弹出通知
            NotificationCenter.default.addObserver(self.keyboardUitls,
                                                   selector: #selector(NotificationUitls.notificationForAll(notification:)),
                                                   name: nil,
                                                   object: nil)
            // 监听键盘弹出通知
            NotificationCenter.default.addObserver(self.keyboardUitls,
                                                   selector: #selector(NotificationUitls.keyboardWillShow(notification:)),
                                                   name:UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            // 监听键盘隐藏通知
            NotificationCenter.default.addObserver(self.keyboardUitls,
                                                   selector: #selector(NotificationUitls.keyboardWillHide(notification:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GoodsData())
    }
}

// MARK: swfitUI 2.0 only for NavigationBar config
//.background(NavigationConfigurator { nc in
//    nc.navigationBar.barTintColor = .blue
//    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//})
