//
//  ViewController.swift
//  Zodiac Project
//
//  Created by user@89 on 02/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var sign = Signs()
    var currentIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        image.layer.cornerRadius = 20
    }
    
    fileprivate func updateUI() {
        let currentSign = sign.getSign(for: currentIndex)
        
        signLabel.text = "\(currentIndex) - \(currentSign)"
        image.image = UIImage(named: "\(currentIndex)\(currentSign)")
    }
    
    @IBAction func prevButton(_ sender: Any) {
        if currentIndex > 1 {
            currentIndex -= 1
        }
        updateUI()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if currentIndex < 12 {
            currentIndex += 1
        }
        updateUI()
    }
    
    @IBAction func tapNext(_ sender: Any) {
        nextButton(sender)
    }
}

