//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Makwan BK on 03/13/2020.
//  Copyright © 2020 Makwan BK. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var result = String()
    var detail = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = result
        detailLabel.text = detail
    }
    

    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
