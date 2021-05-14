//
//  ViewController.swift
//  xANDnil
//
//  Created by x.sargsyan on 1/30/20.
//  Copyright © 2020 SwiftAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var choos = true
    var walk = 0
    var xWinCombination = Set<Int>()
    var oWinCombination = Set<Int>()
    
    let winCombinations = WinCombination().combinations()
    
    @IBOutlet weak var tableLable: UILabel!
    @IBOutlet var buttonsOutletsCollection: [UIButton]!
    @IBOutlet weak var againButtonOutlet: UIButton!
    
    @IBOutlet weak var stackFirstRow: UIStackView!
    @IBOutlet weak var stackSecondRow: UIStackView!
    @IBOutlet weak var stackThirdRow: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonsStyles(buttonsOutletsCollection)
        self.launchScreenAlpha()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.animationForGame()
    }
    
  
    //MARK: -- functions check winner, new round, diable buttons
    
    func checkWinner(button: UIButton, symbol: Character, winSet: inout Set<Int>, combinations: Set<Set<Int>>) {
        walk += 1
        button.setTitle(String(symbol), for: .normal)
        button.isEnabled = false
        winSet.insert(button.tag)
        if walk > 2 {
            for ellement in combinations {
                let tempWinSet = ellement.intersection(winSet)
                if tempWinSet == ellement {
                    self.tableLable.text = "Gamer \(symbol) is won!"
                    self.disableButtons()
                } else if walk == 9 {
                    self.tableLable.text = "Draw !"
                    self.disableButtons()
                }
            }
        }
    }
    
    func newRound(buttonOutletColection: [UIButton]) {
        for button in buttonOutletColection {
            button.setTitle("◉", for: .normal)
            button.isEnabled = true
        }
        self.tableLable.text = ""
        self.xWinCombination.removeAll()
        self.oWinCombination.removeAll()
        choos = false
    }
    
    func disableButtons () {
        for button in buttonsOutletsCollection {
            button.isUserInteractionEnabled = false
        }
    }
    
    
    //MARK: - IBActions
    
    @IBAction func againButton(_ sender: UIButton) {
        self.walk = 0
        newRound(buttonOutletColection: buttonsOutletsCollection)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if choos {
            checkWinner(button: sender, symbol: "❌", winSet: &xWinCombination, combinations: winCombinations)
        } else {
            checkWinner(button: sender, symbol: "⭕️", winSet: &oWinCombination, combinations: winCombinations)
        }
        choos = !choos
    }
    
    
    //MARK: - Animation and button styles
    
    func animationForGame() {
        UIView.animate(withDuration: 1, animations: {
            self.stackFirstRow.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                self.stackSecondRow.alpha = 1
            }) { (true) in
                UIView.animate(withDuration: 1, animations: {
                    self.stackThirdRow.alpha = 1
                }) { (true) in
                    UIView.animate(withDuration: 1) {
                        self.againButtonOutlet.alpha = 1
                    }
                }
            }
        }
    }

    
    func launchScreenAlpha() {
        self.stackFirstRow.alpha = 0
        self.stackSecondRow.alpha = 0
        self.stackThirdRow.alpha = 0
        self.againButtonOutlet.alpha = 0
    }
    
    func buttonsStyles(_ buttonOutlets: [UIButton]) {
        for button in buttonOutlets {
            button.layer.cornerRadius = 20
        }
        
        self.tableLable.layer.cornerRadius = 25
        self.againButtonOutlet.layer.cornerRadius = 25
    }
}



