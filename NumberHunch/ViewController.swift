//
//  ViewController.swift
//  NumberHunch
//
//  Created by Priya Dube on 28/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Declaring Variables
    @IBOutlet weak var lblTimeLeft: UILabel!
    
    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var cardThree: UIButton!
    @IBOutlet weak var cardFour: UIButton!
    
    @IBOutlet weak var lblChooseNumber: UILabel!

    
    var correctNumber = 0 {
        didSet {
            lblChooseNumber.text = "Choose the card of number: \(correctNumber)"
        }
    }
    
    var correctNumberIndex = 0
    var numberArray = [Int](1...10)
    var youWin = false
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }


    // MARK: - Start / Replay the Game
    func startGame()
    {
        cardOne.setImage((UIImage(named: "11")), for: .normal)
        cardTwo.setImage((UIImage(named: "11")), for: .normal)
        cardThree.setImage((UIImage(named: "11")), for: .normal)
        cardFour.setImage((UIImage(named: "11")), for: .normal)
        
        cardOne.isEnabled = true
        cardTwo.isEnabled = true
        cardThree.isEnabled = true
        cardFour.isEnabled = true
        
        numberArray.shuffle()
        correctNumberIndex = Int.random(in: 0...3)
        correctNumber = numberArray[correctNumberIndex]
        
        cardOne.tag = numberArray[0]
        cardTwo.tag = numberArray[1]
        cardThree.tag = numberArray[2]
        cardFour.tag = numberArray[3]
        
    }
    
    
    // MARK: - User Chose a Card
    
    @IBAction func NumberSelected(_ sender: UIButton) {
        
        var title = ""
        var message = ""
        if sender.tag == correctNumber{
            youWin = true
            title = "You Win"
            message = "You chose correct card"
            
        }else{
            youWin = false
            title = "You loose"
            message = "You chose wrong card"
        }
        
        cardOne.setImage((UIImage(named: "\(cardOne.tag)")), for: .normal)
        cardTwo.setImage((UIImage(named: "\(cardTwo.tag)")), for: .normal)
        cardThree.setImage((UIImage(named: "\(cardThree.tag)")), for: .normal)
        cardFour.setImage((UIImage(named: "\(cardFour.tag)")), for: .normal)
        
        cardOne.isEnabled = false
        cardTwo.isEnabled = false
        cardThree.isEnabled = false
        cardFour.isEnabled = false
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .default))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            self.present(alertController, animated: true)
        }
    }
    
    // MARK: - Replay Button Clicked
    @IBAction func ReplayButtonClicked(_ sender: Any) {
        
        startGame()
    }
    
//    // MARK: - Timer Method
//    @objc func fireTimer() {
//        print("Timer fired!")
//    }
    
}

