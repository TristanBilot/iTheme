//
//  ITheme.swift
//  Themes
//
//  Created by Tristan Bilot on 24/11/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class ITheme: UIViewController {
    @IBOutlet weak var text: UILabel!
    
    enum iThemeName: String {
      case light = "light"
      case dark = "dark"
      case blue = "blue"
    }
  
    struct iTheme {
      static var navigationBar: UIColor? = nil
      static var background: UIColor? = nil
      static var title: UIColor? = nil
      static var text: UIColor? = nil
      static var set: iThemeName? = nil
        
        /* Format: [ navigationBar, primaryColor, accentColor, primaryText, secondaryText, background ] */
      
        static let blueSea = [ UIColor(rgb: 0x303F9F), UIColor(rgb: 0x3F51B5), UIColor(rgb: 0x448AFF),
        UIColor(rgb: 0x212121), UIColor(rgb: 0x757575), UIColor(rgb: 0xFFFFFF) ]
      
        static let darkNight = [ UIColor(rgb: 0x000000), UIColor(rgb: 0x000000), UIColor(rgb: 0x000000),
        UIColor(rgb: 0x000000), UIColor(rgb: 0x000000), UIColor(rgb: 0x000000) ]
      
        static let clearLight = [ UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF),
        UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF), UIColor(rgb: 0xFFFFFF) ]
      
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
          navigationBar = palette[0]
          title = palette[1]
          text = palette[4]
          background = palette[5]
        }
      
        static func saveTheme(_ themeName: String?) {
          print("saving " + themeName!)
          guard let name = themeName else { return }
          let defaults = UserDefaults.standard
          defaults.set(name, forKey: "iTheme")
          set = iThemeName(rawValue: themeName!)
        }
    }
  
  @IBAction func bluePress(_ sender: UIButton) {
    iTheme.blue()
    self.viewDidLoad()
  }
  @IBAction func darkPress(_ sender: UIButton) {
    iTheme.dark()
    self.viewDidLoad()
  }
  @IBAction func lightPress(_ sender: UIButton) {
    iTheme.light()
    self.viewDidLoad()
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
      refreshWithTheme()
    }
  
    func loadDefaultTheme() {
      switchTheme(.light)
    }
  
    func refreshWithTheme() {
      self.text.textColor = iTheme.text
      self.view.backgroundColor = iTheme.background
      UINavigationBar.appearance().barTintColor = iTheme.navigationBar
      UINavigationBar.appearance().tintColor = iTheme.navigationBar
//      UINavigationBar.appearance().isTranslucent = true
      UINavigationBar.appearance().backgroundColor = UIColor.red
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
      refreshWithTheme()
      super.viewDidLoad()
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.loadPref()
    }

}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")

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

