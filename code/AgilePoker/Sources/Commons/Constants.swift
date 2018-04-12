//
//  Constants.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

struct AppColors {
    static let background = UIColor(red:3.0/255.0, green:3.0/255.0, blue:3.0/255.0, alpha:1.0)
    static let tint = UIColor.white
    static let clear = UIColor.clear
    static let white = UIColor.white
    static let black = UIColor(red:4.0/255.0, green:4.0/255.0, blue:4.0/255.0, alpha:1.0)
    static let gray = UIColor(red:199.0/255.0, green:199.0/255.0, blue:205.0/255.0, alpha:1.0)
    static let grayLight = UIColor(red:209.0/255.0, green:229.0/255.0, blue:255.0/255.0, alpha:1.0)
    static let skin = UIColor(red:250.0/255.0, green:221.0/255.0, blue:176.0/255.0, alpha:1.0)
    static let pink = UIColor(red:255.0/255.0, green:217.0/255.0, blue:217.0/255.0, alpha:1.0)
    static let pinkLight = UIColor(red:250.0/255.0, green:226.0/255.0, blue:214.0/255.0, alpha:1.0)
    static let pinkDark = UIColor(red:255.0/255.0, green:220.0/255.0, blue:240.0/255.0, alpha:1.0)
    static let green = UIColor(red:213.0/255.0, green:232.0/255.0, blue:211.0/255.0, alpha:1.0)
    static let greenLight = UIColor(red:199.0/255.0, green:243.0/255.0, blue:228.0/255.0, alpha:1.0)
    static let greenDark = UIColor(red:172.0/255.0, green:213.0/255.0, blue:212.0/255.0, alpha:1.0)
    static let blue = UIColor(red:133.0/255.0, green:216.0/255.0, blue:234.0/255.0, alpha:1.0)
    static let blueLight = UIColor(red:180.0/255.0, green:235.0/255.0, blue:252.0/255.0, alpha:1.0)
    static let blueDark = UIColor(red:168.0/255.0, green:187.0/255.0, blue:215.0/255.0, alpha:1.0)
    static let yellow = UIColor(red:239.0/255.0, green:230.0/255.0, blue:127.0/255.0, alpha:1.0)
    static let yellowLight = UIColor(red:245.0/255.0, green:247.0/255.0, blue:213.0/255.0, alpha:1.0)
    static let purple = UIColor(red:221.0/255.0, green:217.0/255.0, blue:239.0/255.0, alpha:1.0)
    private init() {}
}

enum CardType: String {
    case image
    case text
}
