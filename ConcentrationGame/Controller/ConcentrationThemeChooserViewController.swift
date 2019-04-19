//
//  ConcentrationThemeChooserViewController.swift
//  ConcentrationGame
//
//  Created by apple on 4/19/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let themes = [
        "Sports": ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","⛷","🎳","⛳️"],
        "Animals": ["🐶","🦆","🐹","🐸","🐘","🦍","🐓","🐩","🐦","🦋","🐙","🐏"],
        "Faces": ["😀","😌","😎","🤓","😠","😤","😭","😰","😱","😳","😜","😇"]
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }

}
