//
//  ViewController.swift
//  Random Cards
//
//  Created by Delvina Jenoline on 05/01/24.
//  Copyright © 2024 Delvina Jenoline. All rights reserved.
//

import UIKit

var cards:[UIImage] = [UIImage(named: "2H")!,
                       UIImage(named: "3H")!,
                       UIImage(named: "4H")!,
                       UIImage(named: "5H")!,
                       UIImage(named: "6H")!,
                       UIImage(named: "7H")!,
                       UIImage(named: "8H")!,
                       UIImage(named: "9H")!,
                       UIImage(named: "10H")!,
                       UIImage(named: "JH")!,
                       UIImage(named: "QH")!,
                       UIImage(named: "KH")!,
                       UIImage(named: "AH")!,
                       
                       UIImage(named: "2D")!,
                       UIImage(named: "3D")!,
                       UIImage(named: "4D")!,
                       UIImage(named: "5D")!,
                       UIImage(named: "6D")!,
                       UIImage(named: "7D")!,
                       UIImage(named: "8D")!,
                       UIImage(named: "9D")!,
                       UIImage(named: "10D")!,
                       UIImage(named: "JD")!,
                       UIImage(named: "QD")!,
                       UIImage(named: "KD")!,
                       UIImage(named: "AD")!,

                       UIImage(named: "2C")!,
                       UIImage(named: "3C")!,
                       UIImage(named: "4C")!,
                       UIImage(named: "5C")!,
                       UIImage(named: "6C")!,
                       UIImage(named: "7C")!,
                       UIImage(named: "8C")!,
                       UIImage(named: "9C")!,
                       UIImage(named: "10C")!,
                       UIImage(named: "JC")!,
                       UIImage(named: "QC")!,
                       UIImage(named: "KC")!,
                       UIImage(named: "AC")!,

                       UIImage(named: "2S")!,
                       UIImage(named: "3S")!,
                       UIImage(named: "4S")!,
                       UIImage(named: "5S")!,
                       UIImage(named: "6S")!,
                       UIImage(named: "7S")!,
                       UIImage(named: "8S")!,
                       UIImage(named: "9S")!,
                       UIImage(named: "10S")!,
                       UIImage(named: "JS")!,
                       UIImage(named: "QS")!,
                       UIImage(named: "KS")!,
                       UIImage(named: "AS")!,]

let arrayOfStrings = ["2H","3H","4H","5H","6H","7H","8H","9H","10H","JH","QH","KH","AH",
                      "2D","3D","4D","5D","6D","7D","8D","9D","10D","JD","QD","KD","AD",
                      "2C","3C","4C","5C","6C","7C","8C","9C","10C","JC","QC","KC","AC",
                      "2S","3S","4S","5S","6S","7S","8S","9S","10S","JS","QS","KS","AS"]

// Function to get a random string from the array
func getRandomString(from array: [String]) -> String? {
    guard array.count > 0 else {
        return nil // Return nil if the array is empty
    }
    
    let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
    return array[randomIndex]
}



class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var StopBtn: UIButton!
    @IBOutlet var Rules: UIButton!
    @IBOutlet var RestartBtn: UIButton!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        StopBtn.layer.cornerRadius = 8
        RestartBtn.layer.cornerRadius = 8
        Rules.layer.cornerRadius = 8
        
        ChangeTimer()
        
    }
    
    func ChangeTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
   @objc func changeImage() {
    
    imageView.image = UIImage(named: getRandomString(from: arrayOfStrings)!) ?? UIImage(named: "AS")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func StopBtnTapped(_ sender: UIButton) {
        
        timer.invalidate()
    }
    
    @IBAction func ResartBtnTapped(_ sender: UIButton) {
     
        
        timer.invalidate()
        ChangeTimer()
        
    }
    

}

