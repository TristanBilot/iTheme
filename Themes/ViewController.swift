//
//  ViewController.swift
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
    }
  
    struct iTheme {
        static var background: UIColor? = nil
        static var title: UIColor? = nil
        static var text: UIColor? = nil
        static var set: iThemeName? = nil
        
        static func light() {
            background = UIColor.white
            title = UIColor.black
            text = UIColor.lightGray
            set = .light
        }
        
        static func dark() {
            background = UIColor.black
            title = UIColor.white
            text = UIColor.white
            set = .dark
        }
    }
  
    @IBAction func button(_ sender: UIButton) {
      if (iTheme.set == .light)
        {
            iTheme.dark()
            let defaults = UserDefaults.standard
            defaults.set("dark", forKey: "iTheme")
            self.viewDidLoad()
        }
      else if (iTheme.set == .dark)
        {
            iTheme.light()
            let defaults = UserDefaults.standard
            defaults.set("light", forKey: "iTheme")
            self.viewDidLoad()
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
      self.navigationController?.navigationBar.barTintColor = UIColor.black
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

