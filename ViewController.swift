//
//  ViewController.swift
//  MylaN_FormatName
//
//  Created by Myla,Niharica on 1/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    var f = firstNameTextField.text!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    var l = lastNameTextField.text!
    
    @IBOutlet weak var fullNameLabel: UILabel!
  
    
    
    @IBOutlet weak var initialsLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onClickOfSubmit(_ sender: UIButton) {
        fullNameLabel.text = firstNameTextField.text! + " " + lastNameTextField.text!;
        initialsLabel.text = firstNameTextField.prefix(1)+ lastNameTextField.prefix(1);
        
    }
    
    
    @IBAction func onClickOfReset(_ sender: UIButton) {
        fullNameLabel.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        initialsLabel.text = ""
        firstNameTextField.becomeFirstResponder()

    }
    
    
    
    
    
    
}

