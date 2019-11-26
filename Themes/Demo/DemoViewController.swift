//
//  DemoViewController.swift
//  Themes
//
//  Created by Tristan Bilot on 25/11/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var headerView: UIView!
  
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var cardViewTitle: UILabel!
    @IBOutlet weak var cardViewPrice1: UILabel!
    @IBOutlet weak var cardViewPrice2: UILabel!
    @IBOutlet weak var cardViewNum2: UILabel!
    @IBOutlet weak var cardViewNum1: UILabel!
    @IBOutlet weak var notificationsLabel: UILabel!
    
    @IBAction func materialPress(_ sender: UIButton) {
        ITheme.material()
        initTheme()
    }
    
    @IBAction func darkPress(_ sender: UIButton) {
        ITheme.dark()
        initTheme()
    }
    
    @IBAction func lightPress(_ sender: UIButton) {
        ITheme.light()
        initTheme()
    }
    
    private func initTheme() {
        view.backgroundColor = ITheme.pageBackground
        headerView.roundCorners([.bottomLeft, .bottomRight], radius: 20)
        headerView.backgroundColor = ITheme.viewBackground
        
        topView.layer.cornerRadius = 10
        cardView.layer.cornerRadius = 10
        topView.backgroundColor = ITheme.viewBackground
        titleLabel.textColor = ITheme.title
        descLabel.textColor = ITheme.subTitle
        totalAmountLabel.textColor = ITheme.text
        totalLabel.textColor = ITheme.text
        cardView.backgroundColor = ITheme.viewBackground
        
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button1.backgroundColor = ITheme.buttonBackground
        button2.backgroundColor = ITheme.buttonBackground
        button3.backgroundColor = ITheme.buttonBackground
        button1.setTitleColor(ITheme.buttonText, for: .normal)
        button2.setTitleColor(ITheme.buttonText, for: .normal)
        button3.setTitleColor(ITheme.buttonText, for: .normal)
        
        cardViewTitle.textColor = ITheme.text
        cardViewPrice1.textColor = ITheme.text
        cardViewPrice2.textColor = ITheme.text
        cardViewNum2.textColor = ITheme.text
        cardViewNum1.textColor = ITheme.text
        notificationsLabel.textColor = ITheme.subTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ITheme.loadPref()
        initTheme()
    }
    
}
