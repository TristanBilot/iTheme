//
//  ITheme.swift
//  Themes
//
//  Created by Tristan Bilot on 24/11/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class ITheme {
    
    /*
     You should add functions to this array if you want to implement
     more themes in your app.
     */

    fileprivate static let themes =
    [
        "light": light,
        "dark": dark,
        "material": material
    ]
    
    /*
     Each element represents a color, so every elements of the same type will be
     the of the same color in the hole application.
     You can add or modify this variables as you want.
     */
    
    static var buttonBackground: UIColor? = nil
    static var buttonText: UIColor? = nil
    static var pageBackground: UIColor? = nil
    static var viewBackground: UIColor? = nil
    static var text: UIColor? = nil
    static var title: UIColor? = nil
    static var subTitle: UIColor? = nil
    
    /*
     Basically, you need to implement a color per type of object.
     In this case, I used 7 elements so I built an array of 7 associated
     colors.
     */
    
    /* Format: [ buttonBackground, buttonText, pageBackground, viewBackground, text, title, subTitle ] */
    fileprivate static let lightPal =
    [
        UIColor(rgb: 0x3F51B5), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xebebeb),
        UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0x212121),
        UIColor(rgb: 0x212121)
    ]
  
    fileprivate static let darkPal =
    [
        UIColor(rgb: 0x48484a), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x323232),
        UIColor(rgb: 0x48484a), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF),
        UIColor(rgb: 0xFFFFFF)
    ]
  
    fileprivate static let materialPal =
    [   UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0x00796B),
        UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0xFFFFFF),
        UIColor(rgb: 0xFFFFFF)
    ]
    
    /*
     Don't forget to add all your elements here if you added some objects earlier.
     */
  
    fileprivate static func loadPalette(_ palette: [UIColor?]) {
        buttonBackground = palette[0]
        buttonText       = palette[1]
        pageBackground   = palette[2]
        viewBackground   = palette[3]
        text             = palette[4]
        title            = palette[5]
        subTitle         = palette[6]
    }
    
    static let light: () -> () = {
        loadPalette(lightPal)
        saveTheme("light")
    }
    
    static let dark: () -> () = {
        loadPalette(darkPal)
        saveTheme("dark")
    }
  
    static let material: () -> () =  {
        loadPalette(materialPal)
        saveTheme("material")
    }
  
    static func loadPref() {
        ITheme.switchTheme(getPref())
    }
  
    static func saveTheme(_ themeName: String?) {
        guard let name = themeName else { return }
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "iTheme")
    }

    fileprivate static func switchTheme(_ key: String?) {
        if key == nil {
            ITheme.loadDefaultTheme()
            return
        }
        themes[key!]!()
    }
          
    fileprivate static func getPref() -> String? {
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "iTheme") {
            print(name)
            return name
        }
        return nil
    }
    
    fileprivate static func loadDefaultTheme() {
        switchTheme("light")
    }
    
}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255)
    assert(green >= 0 && green <= 255)
    assert(blue >= 0 && blue <= 255)

    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green)
        / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
}

  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}

