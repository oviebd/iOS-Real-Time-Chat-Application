//
//  Utility.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import Foundation
import UIKit

class Utility {
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }

    static func makeURL(path: String?) -> URL? {
        if let path = path {
            let url = URL(string: path)
            return url
        }
        return nil
    }
}
