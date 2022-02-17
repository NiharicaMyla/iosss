//
//  ViewController.swift
//  CAL_MYLA
//
//  Created by Myla,Niharica on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }

func clearAll() {
work = ""
label.text = ""
}

    @IBOutlet weak var display: UILabel!
    var work:String= "";
   
    @IBAction func AC(_ sender: UIButton) {
clearAll()
    }
    
    
    @IBAction func div(_ sender: UIButton) {
        add(value: "?")
    }
    

    @IBAction func plusormin(_ sender: UIButton) {
add(value: "?")
    }
    
    @IBAction func clear(_ sender: UIButton) {
	if(!work.isEmpty)
{
work.removeAll()
display.text = ""
}

       func add(value: String)
{
work = workings + value
display.text = work
    }
    
    
    @IBAction func zero(_ sender: UIButton) {
        add(value: "0")
    }
    
    @IBAction func dot(_ sender: UIButton) {
       add(value: ".")
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        add(value: "=")
	let checkedWorkingforPercent = work.replacingOccurences(of: "%", with: "*0.01")
	let expression = NSExpression(format: checkedWorkingforPercent)
	let result = expression.expressionValue(with: nil, context: nil) as! Double
	let resultString = formatResult(result: result)
	display.text = resultString
    }
else 
{
let alert = UIAlertController(
title: "Invalid Input",
message: "Calculator unable to do math based on input",
preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "Okay", style: .default, handle))
self.present(alert, animated: true, completion:nil)
}
}

func validInput() ->Bool
{
var count = 0
var funcCharIndexes = [Int]()
for char in work
{
if(spclchar(char: char))
{
funcCharIndexes.append(count)
}
count+=1
}
var previous: Int = -1
for index in funcCharIndexes
{
if(index == 0)
{
return false
}
if(index == 0)
{
return false
}
if(index == work.count -1)
{
return false
}
if (previous != 1)
{
if(index - previous == 1)
{
return false
}
}
previous = index

return true
}

func spclchar (char: Character) -> Bool





 

func formatResult(result: Double) -> String {
if(result.truncatingRemainder(divingBy: 1) == 0)
{
return String(format: %.0f", result)
}
else {
return Stgring(format: ".2f', result)
}
}
    
    
    @IBAction func one(_ sender: UIButton) {
       add(value: "1")
        
            }
    
    
    @IBAction func two(_ sender: UIButton) {
        add(value: "2")
    }
    
    
    @IBAction func three(_ sender: UIButton) {
        add(value: "3")
    }
    
    
    @IBAction func plus(_ sender: UIButton) {
        add(value: "+")
    }
    
    
    @IBAction func four(_ sender: UIButton) {
        add(value: "4")
    }
    
    
    @IBAction func five(_ sender: UIButton) {
        add(value: "5")
    }
    
    @IBAction func six(_ sender: UIButton) {
        add(value: "6")
    }
    
    @IBAction func minus(_ sender: UIButton) {
        add(value: "-")
    }
    
    @IBAction func seven(_ sender: UIButton) {
       add(value: "7")
    }
    
    
    @IBAction func eight(_ sender: UIButton) {
        add(value: "8")
    }
    
    
    @IBAction func nine(_ sender: UIButton) {
        add(value: "9")
    }
    
    
    @IBAction func multi(_ sender: UIButton) {
        add(value: "*")
    }
    
   
    @IBAction func percent(_ sender: UIButton) {
        add(value: "%")
    }
    
    
    
    
    
    
    
    
    
    
    
}

