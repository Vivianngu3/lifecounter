//
//  ViewController.swift
//  lifecounter
//
//  Created by Vivian Nguyen on 4/21/21.
//

import UIKit
 
var history: [String] = []

class ViewController: UIViewController {
    
   
    @IBOutlet weak var players: UIStackView!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var minusPlayerButton: UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        while count < 4 {
            count += 1
            let player = PlayerView()
            player.gameSettings = self
            player.data = ("Player \(count)", 20)
            player.tag = count
            players.addArrangedSubview(player)
        }
    }
    
    public func startingGame() {
            addPlayerButton.isEnabled = false
            minusPlayerButton.isEnabled = false
            
        }
    
    @IBAction func addPlayers(_ sender: Any) {
        count += 1
        let player = PlayerView()
        player.gameSettings = self
        player.data = ("Player \(count)", 20)
        players.addArrangedSubview(player)
        
        if count == 8 {
            addPlayerButton.isEnabled = false
        }
        if count != 2 {
            minusPlayerButton.isEnabled = true
        }
    }
    
    @IBAction func minusPlayer(_ sender: Any) {
        players.arrangedSubviews[count - 1].removeFromSuperview()
        count -= 1
        if count != 8 {
            addPlayerButton.isEnabled = true
        }
        if count == 2 {
            minusPlayerButton.isEnabled = false
        }
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
    var gameSettings : ViewController? = nil
    
    
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
        gameSettings?.startingGame()
        history.append("\(data.0) lost 5 lives")
        
    }
    
    
    @objc private func minus1(_ sender : UIButton) {
        
        data = (data.0, data.1 - 1)
        label.text = "\(data.0) : \(data.1)"
        gameSettings?.startingGame()
        history.append("\(data.0) lost 1 life")
        
    }
    
    @objc private func plus1(_ sender : UIButton) {
        
        data = (data.0, data.1 + 1 )
        label.text = "\(data.0) : \(data.1)"
        gameSettings?.startingGame()
        history.append("\(data.0) gained 1 life")
        
    }
    
    @objc private func plus5(_ sender : UIButton) {
        
        data = (data.0, data.1 + 5 )
        label.text = "\(data.0) : \(data.1)"
        gameSettings?.startingGame()
        history.append("\(data.0) gained 5 lives")
    }
}

class HistoryView: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let(log) = history [indexPath.row]
        
        cell.textLabel?.text = log
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTableView.dataSource = self
        
    }
    
}

