//
//  ITheme.swift
//  Themes
//
//  Created by Tristan on 24/11/2019.
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
    [   UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0xf8bbd0),
        UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0x212121),
        UIColor(rgb: 0x212121)
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
  
    /*
     Fetch the last used theme (often used at the launch of the application).
     */
          
    fileprivate static func getPref() -> String? {
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "iTheme") {
            return name
        }
        return nil
    }
  
    static func loadPref() {
        switchTheme(getPref())
    }
  
    /*
     Save the last used theme in UserDesfaults to take it back even if
     the user close the app.
     */
  
    static func saveTheme(_ themeName: String?) {
        guard let name = themeName else { return }
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "iTheme")
    }

    fileprivate static func switchTheme(_ key: String?) {
        guard let key = key else {
          loadDefaultTheme()
          return
        }
        themes[key]!()
    }
  
    /*
     The default theme is light.
     */
    
    fileprivate static func loadDefaultTheme() {
        switchTheme("light")
    }
  
    /*
     You could apply linear gradient background to your views with
     this method.
     */
  
    static func setGradientBackground(_ view: UIView) {
        let colorTop: CGColor =  ITheme.pageBackground!.cgColor
        let colorBottom: CGColor = ITheme.viewBackground!.cgColor
      
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at:0)
  }
    
}
