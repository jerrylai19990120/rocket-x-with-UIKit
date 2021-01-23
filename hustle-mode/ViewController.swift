//
//  ViewController.swift
//  hustle-mode
//
//  Created by Jerry Lai on 2021-01-22.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    
    @IBOutlet weak var powerBtn: UIButton!
    
    @IBOutlet weak var cloudHolder: UIView!
    
    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var hustleLabel: UILabel!
    
    @IBOutlet weak var OnLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError {
            print(error.description)
        }
        
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 120, width: 414, height: 695)
        }) {
            (finished) in
            self.hustleLabel.isHidden = false
            self.OnLabel.isHidden = false

        }
    }
    

}

