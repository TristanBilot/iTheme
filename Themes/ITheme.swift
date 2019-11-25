//
//  ITheme.swift
//  Themes
//
//  Created by Tristan Bilot on 24/11/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class ITheme {

    enum iThemeName: String {
      case light = "light"
      case dark = "dark"
      case blue = "blue"
    }
  
    struct iTheme {
      static var button: UIColor? = nil
      static var buttonText: UIColor? = nil
      static var background: UIColor? = nil
      static var backgroundView: UIColor? = nil
      static var text: UIColor? = nil
      static var title: UIColor? = nil
      static var subTitle: UIColor? = nil
      static var set: iThemeName? = nil
        
        /* Format: [ navigationBar, primaryColor, accentColor, primaryText, secondaryText, background ] */
      
        static let clearLight = [ UIColor(rgb: 0x3F51B5), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xebebeb), UIColor(rgb: 0xFFFFFF),
                                  UIColor(rgb: 0x212121), UIColor(rgb: 0x212121), UIColor(rgb: 0x212121) ]
      
        static let darkNight = [ UIColor(rgb: 0x48484a), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x323232), UIColor(rgb: 0x48484a),
                                 UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF) ]
      
        static let blueSea = [ UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0x212121), UIColor(rgb: 0x00796B), UIColor(rgb: 0xFFFFFF),
                               UIColor(rgb: 0x212121), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF) ]
      
        static func light() {
          loadPalette(clearLight)
          saveTheme("light")
        }
        
        static func dark() {
          loadPalette(darkNight)
          saveTheme("dark")
        }
      
        static func blue() {
          loadPalette(blueSea)
          saveTheme("blue")
        }
      
        static func loadPalette(_ palette: [UIColor?]) {
            button         = palette[0]
            buttonText     = palette[1]
            background     = palette[2]
            backgroundView = palette[3]
            text           = palette[4]
            title          = palette[5]
            subTitle       = palette[6]
        }
      
        static func saveTheme(_ themeName: String?) {
          print("saving " + themeName!)
          guard let name = themeName else { return }
          let defaults = UserDefaults.standard
          defaults.set(name, forKey: "iTheme")
          set = iThemeName(rawValue: themeName!)
        }
    }

    func switchTheme(_ key: iThemeName?) {
      if key == nil {
        loadDefaultTheme()
      }
      else {
        switch key {
        case .dark:
          iTheme.dark()
          break
        case .light:
          iTheme.light()
          break
        case .blue:
          iTheme.blue()
          break
        default:
          break
        }
      }
    }
  
    func loadDefaultTheme() {
      switchTheme(.dark)
    }
    
    func getPref() -> iThemeName? {
      let defaults = UserDefaults.standard
      if let name = defaults.string(forKey: "iTheme") {
        return iThemeName(rawValue: name)
      }
      return nil
    }
    
    func loadPref() {
      switchTheme(getPref())
    }

}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255)
    assert(green >= 0 && green <= 255)
    assert(blue >= 0 && blue <= 255)

    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
}

  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}

