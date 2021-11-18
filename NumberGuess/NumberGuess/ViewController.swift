///
//  ViewController.swift
//  NumberGuesser_2
//
//  Created by Nico Rausch on 07.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var EdtGuess: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btnGuess: UIButton!
    var model = NumberGuessModel()
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        print(model.target)
        model.guessCount += 1
        if model.isValid(string: EdtGuess.text) {
            let compare = model.compare(to: Int(EdtGuess.text!)!)
            print(compare)
            if (compare > 0) {
                label.text = "Zu niedrig!"
            } else if (compare < 0) {
                label.text = "Zu hoch"
            } else {
                label.text = ("Du hast \(model.guessCount) Versuche gebraucht")
                let imgName: String = model.getImage()
                image.image = UIImage(named: imgName)
                image.isHidden = false
            }
        }
    }
    
    @IBAction func onEdtTextChanged(_ sender: UITextField) {
        print("text changed: \(sender.text)")
        btnGuess.isEnabled = model.isValid(string: sender.text)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.target = Int.random(in: 0...100)
        print(model.target)
        label.text = ""
        label.textAlignment = NSTextAlignment.center
        btnGuess.setTitle("Guess", for: .normal)
    }
    
    
}
