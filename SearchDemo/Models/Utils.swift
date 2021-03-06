//
//  Remote.swift
//  SearchDemo
//
//  Created by Lonmee on 8/15/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

import Foundation
import SwiftHTTP
import UIKit

func deserialize<T: Codable> (_ data: T) -> String {
    do {
        let data = try JSONEncoder().encode(data)
        return String(data: data, encoding: .utf8)!
    } catch {
        fatalError("Couldn't encode \(data) as \(T.self):\n\(error)")
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

class NotificationListener: NSObject {
    static let sharedInstance = NotificationListener()
    @objc func notificationForAll(notification: Notification) {
        print(notification.name)
        switch notification.name {
        case UIResponder.keyboardWillShowNotification: break
        case UIResponder.keyboardWillHideNotification: break
        default: break
        }
    }
}

