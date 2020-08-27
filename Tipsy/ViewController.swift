//
//  ViewController.swift
//  Tipsy
//
//  Created by Makwan BK on 03/13/2020.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var currentTip = String()
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitLabel.text = "\(Int(stepper.value))"
        
        billTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardWhenTapped(_:)))
        view.addGestureRecognizer(tap)
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        currentTip = sender.currentTitle!
        
        let title = "0.\(sender.currentTitle!)".replacingOccurrences(of: "%", with: "", options: .backwards, range: nil)
        tip = Double(title)!
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        splitLabel.text = "\(Int(sender.value))"
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        
        guard let bill = billTextField.text else {return}
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let res = billTotal * (1 + tip) / Double(numberOfPeople)
            result = String(format: "%.2f", res)
            
        } else {
            let alert = UIAlertController(title: "Text field is empty!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
       

        if let vc = storyboard?.instantiateViewController(identifier: "ResultView") as? ResultViewController {
            
            vc.result = String(result)
            vc.detail = "Split between \(Int(numberOfPeople)) people, with \(currentTip) tip."
            
            present(vc, animated: true)
        }
        
    }
    
    @objc func dismissKeyboardWhenTapped(_ sender: UITapGestureRecognizer) {
        billTextField.endEditing(true)
    }
    
    
}

