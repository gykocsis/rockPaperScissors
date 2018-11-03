//
//  ViewController.swift
//  RockPaperScissorsFuckYeah
//
//  Created by Kocsis György on 2018. 10. 02..
//  Copyright © 2018. Gweilo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerButton: UIButton!
    @IBOutlet var symbolButtons: [UIButton]!
    @IBOutlet weak var TitleBar: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var victoryBanner: UILabel!

    private var rockPaperScissorsTheme: [String] = ["🤛","✋","✌️"]
    
    lazy private var game = RockPaperScissors(numberOfCards:symbolButtons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func initializeNewGameScreen(){
        self.view.backgroundColor = UIColor.lightGray
        computerButton.setTitle("🤖", for: .normal)
        computerButton.isEnabled = false
        victoryBanner.text = "Choose your symbol"
        newGameButton.isEnabled = false
        newGameButton.isHidden = true
        for i in 1...symbolButtons.count{
            symbolButtons[i-1].setTitle(rockPaperScissorsTheme[i-1], for: .normal)
            symbolButtons[i-1].isEnabled = true
            symbolButtons[i-1].isHidden = false
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeNewGameScreen()
        
    }
    

    @IBAction func touchButton(_ sender: UIButton) {
        if let touchedButtonIndex = symbolButtons.index(of: sender)
        {
            //print("You have touched the \(touchedButtonIndex) of the cards")
            //print("There are currently \(symbolButtons.count) cards shown.")
            var tempSymbolButtons = symbolButtons
            tempSymbolButtons!.remove(at: touchedButtonIndex)
            for i in 0...(tempSymbolButtons!.count-1){
                tempSymbolButtons![i].isHidden = true
            }
            
            let (computerChoice, indexOfComputerChoice) = game.returnComputerCard(playerCard: touchedButtonIndex)
        updateViewFromModel(gameResult:computerChoice,indexOfChosenCard:indexOfComputerChoice)
  
            //print(x)
            
        }
        else
        {
            print("There's no card in the list")
        }
       
    }
    
    
    private func updateViewFromModel(gameResult: Int, indexOfChosenCard: Int) {
        newGameButton.isEnabled = true
        newGameButton.isHidden = false
        computerButton.setTitle(rockPaperScissorsTheme[indexOfChosenCard], for: .normal)
        switch gameResult {
        case 0:
            self.view.backgroundColor = UIColor.white
            victoryBanner.text = "Draw"
        case -1:
            self.view.backgroundColor = UIColor.red
            victoryBanner.text = "You lost!"
        case 1:
            self.view.backgroundColor = UIColor.green
            victoryBanner.text = "You won!"

        default:
            self.view.backgroundColor = UIColor.black

        }
    }

    
    @IBAction func newGameButtonPressed(_ sender: Any) {
        game = RockPaperScissors(numberOfCards:symbolButtons.count)
        initializeNewGameScreen()
    }
    
}

