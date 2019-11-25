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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var cardViewTitle: UILabel!
    @IBOutlet weak var cardViewPrice1: UILabel!
    @IBOutlet weak var cardViewPrice2: UILabel!
    @IBOutlet weak var cardViewNum2: UILabel!
    @IBOutlet weak var cardViewNum1: UILabel!
    @IBOutlet weak var notificationsLabel: UILabel!
    
    @IBAction func bluePress(_ sender: UIButton) {
        ITheme.iTheme.blue()
        viewDidLoad()
    }
    
    @IBAction func darkPress(_ sender: UIButton) {
        ITheme.iTheme.dark()
        viewDidLoad()
    }
    
    @IBAction func lightPress(_ sender: UIButton) {
        ITheme.iTheme.light()
        viewDidLoad()
    }
    
    private func initTheme() {
        view.backgroundColor = ITheme.iTheme.background
        
        topView.layer.cornerRadius = 10
        cardView.layer.cornerRadius = 10
        topView.backgroundColor = ITheme.iTheme.backgroundView
        titleLabel.textColor = ITheme.iTheme.title
        descLabel.textColor = ITheme.iTheme.subTitle
        totalAmountLabel.textColor = ITheme.iTheme.text
        totalLabel.textColor = ITheme.iTheme.text
        cardView.backgroundColor = ITheme.iTheme.backgroundView
        
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button1.backgroundColor = ITheme.iTheme.button
        button2.backgroundColor = ITheme.iTheme.button
        button3.backgroundColor = ITheme.iTheme.button
        button1.setTitleColor(ITheme.iTheme.buttonText, for: .normal)
        button2.setTitleColor(ITheme.iTheme.buttonText, for: .normal)
        button3.setTitleColor(ITheme.iTheme.buttonText, for: .normal)
        
        cardViewTitle.textColor = ITheme.iTheme.text
        cardViewPrice1.textColor = ITheme.iTheme.text
        cardViewPrice2.textColor = ITheme.iTheme.text
        cardViewNum2.textColor = ITheme.iTheme.text
        cardViewNum1.textColor = ITheme.iTheme.text
        notificationsLabel.textColor = ITheme.iTheme.subTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTheme()
    }
    
}
