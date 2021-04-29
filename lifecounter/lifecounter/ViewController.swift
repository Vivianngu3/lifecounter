//
//  ViewController.swift
//  lifecounter
//
//  Created by Vivian Nguyen on 4/21/21.
//

import UIKit

 
var history:[String] = []

protocol gameSettings {
    func startingGame()
}

class ViewController: UIViewController, gameSettings {

    @IBOutlet weak var players: UIStackView!
    @IBOutlet weak var addPlayerButton: UIButton!
    var count = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPlayers(_ sender: Any) {
        let name = "Player \(count)"
        let life = 20
        let playerView = PlayerView()
        playerView.data = (name, life)
        players.addArrangedSubview(playerView)
        count += 1
        if count == 9 {
            addPlayerButton.isEnabled = false
        }
    }
    
    func startingGame() {
        addPlayerButton.isEnabled = false
    }
}

class PlayerView: UIView {
    
    var data : (String, Int) = ("", -1) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1)"
        }
    }

    weak var label : UILabel!
    weak var minus5button : UIButton!
    weak var minus1button : UIButton!
    weak var plus1button : UIButton!
    weak var plus5button : UIButton!
    var delegate: gameSettings?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    
    private func initSubViews() {
        let nib = UINib(nibName: "PlayerPanel", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
        label = (nibView.subviews[0].subviews[0] as! UILabel)
        label.text = "\(data.0) : \(data.1)"
        
        minus5button = (nibView.subviews[0].subviews[1] as! UIButton)
        minus5button.addTarget(self, action: #selector(minus5(_:)), for: .touchUpInside)
        
        minus1button = (nibView.subviews[0].subviews[2] as! UIButton)
        minus1button.addTarget(self, action: #selector(minus1(_:)), for: .touchUpInside)
        
        plus1button = (nibView.subviews[0].subviews[3] as! UIButton)
        plus1button.addTarget(self, action: #selector(plus1(_:)), for: .touchUpInside)
        
        plus5button = (nibView.subviews[0].subviews[4] as! UIButton)
        plus5button.addTarget(self, action: #selector(plus5(_:)), for: .touchUpInside)
    }
    
    @objc private func minus5(_ sender : UIButton) {
        data = (data.0, data.1 - 5 )
        label.text = "\(data.0) : \(data.1)"
        history.append("5 subtracted from \(data.0)")
        delegate!.startingGame()
    }
    
    @objc private func minus1(_ sender : UIButton) {
        data = (data.0, data.1 - 1)
        label.text = "\(data.0) : \(data.1)"
        history.append("1 subtracted from \(data.0)")
        delegate!.startingGame()
    }
    
    @objc private func plus1(_ sender : UIButton) {
        data = (data.0, data.1 + 1 )
        label.text = "\(data.0) : \(data.1)"
        history.append("1 added to \(data.0)")
        delegate!.startingGame()
    }
    
    @objc private func plus5(_ sender : UIButton) {
        data = (data.0, data.1 + 5 )
        label.text = "\(data.0) : \(data.1)"
        history.append("5 added to \(data.0)")
        delegate!.startingGame()
    }
}

class HistoryView: UIViewController {

    @IBOutlet weak var historyLogs: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

}


