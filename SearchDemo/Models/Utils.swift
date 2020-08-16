//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/15/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation
import SwiftHTTP

func deserialize<T: Codable> (_ data: T) -> String {
    do {
        let data = try JSONEncoder().encode(data)
        return String(data: data, encoding: .utf8)!
    } catch {
        fatalError("Couldn't code \(data) as \(T.self):\n\(error)")
    }
}

func serialize<T: Decodable>(_ data: Data) -> T {
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(data) as \(T.self):\n\(error)")
    }
}

func spaceTrimmer(str: String) -> String {
    let whitespace = NSCharacterSet.whitespacesAndNewlines
    return str.trimmingCharacters(in: whitespace)
}

class NotificationUitls: NSObject {
    // all notification
    @objc func notificationForAll(notification: Notification) {
        print(notification.name.rawValue)
    }
    // 键盘显示
    @objc func keyboardWillShow(notification: Notification) {
        print("键盘将要出现")
    }
    // 键盘隐藏
    @objc func keyboardWillHide(notification: Notification) {
        print("键盘将要隐藏")
    }
}

