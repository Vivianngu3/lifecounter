//
//  ViewController.swift
//  lifecounter
//
//  Created by Vivian Nguyen on 4/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var p1Life: UILabel!
    @IBOutlet weak var p2Life: UILabel!
    @IBOutlet weak var p3Life: UILabel!
    @IBOutlet weak var p4Life: UILabel!
    @IBOutlet weak var playerLose: UILabel!
    
    
    func lifeCount (value: Int, player: Int) {
            switch player {
                case 1:
                    let totalLife = Int(p1Life.text!)!
                    let newLife = totalLife + value
                    p1Life.text = String(newLife)
                    if (newLife <= 0) {
                        playerLose.text = "Player 1 Loses!"
                    }
                case 2:
                    let totalLife = Int(p2Life.text!)!
                    let newLife = totalLife + value
                    p2Life.text = String(newLife)
                    if (newLife <= 0) {
                        playerLose.text = "Player 2 Loses!"
                    }
                case 3:
                    let totalLife = Int(p3Life.text!)!
                    let newLife = totalLife + value
                    p3Life.text = String(newLife)
                    if (newLife <= 0) {
                        playerLose.text = "Player 3 Loses!"
                    }
                case 4:
                    let totalLife = Int(p4Life.text!)!
                    let newLife = totalLife + value
                    p4Life.text = String(newLife)
                    if (newLife <= 0) {
                        playerLose.text = "Player 4 Loses!"
                    }
            default:
                print("non-existant")
                
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func minusFiveP1(_ sender: Any) {
        lifeCount(value: -5, player: 1)
    }
    
    @IBAction func minusOneP1(_ sender: Any) {
        lifeCount(value: -1, player: 1)
    }
   
    @IBAction func plusOneP1(_ sender: Any) {
        lifeCount(value: +1, player: 1)
    }
    
    @IBAction func plusFiveP1(_ sender: Any) {
        lifeCount(value: +5, player: 1)
    }
    
    @IBAction func minusFiveP2(_ sender: Any) {
        lifeCount(value: -5, player: 2)
    }
    
    @IBAction func minusOneP2(_ sender: Any) {
        lifeCount(value: -1, player: 2)
    }
    
    @IBAction func plusOneP2(_ sender: Any) {
        lifeCount(value: +1, player: 2)
    }
    
    @IBAction func plusFiveP2(_ sender: Any) {
        lifeCount(value: +5, player: 2)
    }
    
    @IBAction func minusFiveP3(_ sender: Any) {
        lifeCount(value: -5, player: 3)
    }
    
    @IBAction func minusOneP3(_ sender: Any) {
        lifeCount(value: -1, player: 3)
    }
    
    @IBAction func plusOneP3(_ sender: Any) {
        lifeCount(value: +1, player: 3)
    }
    
    @IBAction func plusFiveP3(_ sender: Any) {
        lifeCount(value: +5, player: 3)
    }
    
    @IBAction func minusFiveP4(_ sender: Any) {
        lifeCount(value: -5, player: 4)
    }
    
    @IBAction func minusOneP4(_ sender: Any) {
        lifeCount(value: -1, player: 4)
    }
    
    @IBAction func plusOneP4(_ sender: Any) {
        lifeCount(value: +1, player: 4)
    }
    
    @IBAction func plusFiveP4(_ sender: Any) {
        lifeCount(value: +5, player: 4)
    }
    
}

