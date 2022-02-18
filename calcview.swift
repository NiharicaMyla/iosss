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

   @IBOutlet weak var display: UILabel!
    var no1 = ""
    var no2 = ""
    var reslt = ""
    var operand = ""
    var justno1 = ""
    var operand1 = false
    var change1 = false
   
    @IBAction func AC(_ sender: UIButton) {
     
        clearAll()
    }
    func clearAll(){
        no1 = ""
        no2 = ""
        operand1 = false
        operand = ""
        justno1 = ""
        viewLoad.text = ""
        change1 = false
    }
    func addValue(_ number: String){
        if viewLoad.text == "0"{
            viewLoad.text = ""
        }
        else{
            if !operand1{
                viewLoad.text! += number
                no1 += number
            }
            else{
                if !change1{
                    viewLoad.text! += number
                    no2 += number
                }
                else{
                    viewLoad.text = ""
                    viewLoad.text! += number
                    no2 += number
                }
            }
        }
    }
    
    func calcTab(_ operand:String)->String {
        if no1 != "" && no2 != ""{
            if operand == "+"{
                no1 = String(Double(no1)! + Double(no2)!)
                justno1 = no2
                no2 = ""
                return String(no1)
            }
            if operand == "-"{
                no1 = String(Double(no1)! - Double(no2)!)
                justno1 = no2
                no2 = ""
                
                return String(no1)
            }
            if operand == "*"{
                no1 = String(Double(no1)! * Double(no2)!)
                justno1 = no2
                no2 = ""
                return String(no1)
            }
            if operand == "/"{
                no1 = String(Double(no1)! / Double(no2)!)
                justno1 = no2
                no2 = ""
                return String(no1)
            }
            if operand == "%" {
                let op1 = Double(no1)!
                let op2 = Double(no2)!
                var remm = op1.remainder(dividingBy: op2)
                no1 = String(remm)
                justno1 = no2
                no2 = ""
                return String(no1)
            }
        }
        return ""
    }
    func resultFormatter(_ reslt:String)->String {
        let value = Double(reslt)!
        var resultStr = String(round(value * 100000) / 100000.0)
        
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        
        return resultStr
    }
    
    
    @IBAction func div(_ sender: UIButton) {
        let cal = calcTab(operand)
        operand = "/"
        viewLoad.text = (cal != "") ? resultFormatter(cal) : ""
          if cal != "" {
              //            change1 = true
              if no2 != ""{
                  change1 = true
                  
                  if operand1 {
                      reslt = String(Double(cal)! / Double(no2)!)
                      print(reslt)
                      if reslt == "inf"{
                        viewLoad.text! = "Error"
                      }else{
                        viewLoad.text! = resultFormatter(reslt)
                      }
                  }
              }
          }
          operand1 = true
    }
    

    @IBAction func plusormin(_ sender: UIButton) {
	let plsminus = viewLoad.text!
        var total = (plsminus as NSString).doubleValue
        if(total > 0){
            total = total * -1;
            let strin = String(format: "%.0f", total)
            viewLoad.text = strin;

        }
        else{
            total = total * -1;
            let strin = String(format: "%.0f", total)
            viewLoad.text = strin;

        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
	   no2 = ""
        viewLoad.text = ""
    }
    
    @IBAction func zero(_ sender: UIButton) {
        add(value: "0")
    }
    
    @IBAction func dot(_ sender: UIButton) {
       add(value: ".")
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
 var reslt1 = ""
        switch operand {
        case "+":
            
        if justno1 != "" {
                reslt1 = String(Double(no1)! + Double(justno1)!)
                viewLoad.text = resultFormatter(reslt1)
                 no2 = justno1
            }else{
                reslt1 = String(Double(no1)! + Double(no2)!)
                viewLoad.text = resultFormatter(reslt1)
            }
            no1 = reslt1
            
            break
        case "*":
            if justno1 != "" {
                reslt1 = String(Double(no1)! * Double(justno1)!)
                viewLoad.text = resultFormatter(reslt1)
            }else{
                reslt1 = String(Double(no1)! * Double(no2)!)
                viewLoad.text = resultFormatter(reslt1)
            }
            no1 = reslt1
            
            break
        case "-":
            if justno1 != "" {
                reslt1 = String(Double(no1)! - Double(justno1)!)
                viewLoad.text = resultFormatter(reslt1)
                
            }else{
                reslt1 = String(Double(no1)! - Double(no2)!)
                viewLoad.text = resultFormatter(reslt1)
               
            }
            no1 = reslt1
            break
        case "/":
            if viewLoad.text == "Error"{
                clearAll()
            }else{
                if justno1 != "" {
                    reslt1 = String(Double(no1)! / Double(justno1)!)
                    if reslt1 == "inf"{
                        viewLoad.text! = "Error"
                        return
                    }else{
                        viewLoad.text = resultFormatter(reslt1)
                    }
                }else{
                    reslt1 = String(Double(no1)! / Double(no2)!)
                    if reslt1 == "inf"{
                        viewLoad.text! = "Error"
                        return
                    }else{
                        viewLoad.text = resultFormatter(reslt1)
                    }
                }
                no1 = reslt1
            }
            break
        case "%":
            if justno1 != "" {
                viewLoad.text = resultFormatter(reslt1)
                let op1 = Double(no1)!
                let op2 = Double(justno1)!
                var remm = op1.remainder(dividingBy: op2)
                reslt1 = String(remm)
                 no2 = justno1
            }else{
                let op1 = Double(no1)!
                let op2 = Double(no2)!
                var remm = op1.remainder(dividingBy: op2)
                reslt1 = String(remm)
                viewLoad.text = resultFormatter(reslt1)
            }
            no1 = reslt1
            
            break
            
        default:
            print("IOS")
        }
}    
    
    @IBAction func two(_ sender: UIButton) {
        addValue("7")
    }
    
    
    @IBAction func three(_ sender: UIButton) {
        addValue("7")
    }
    
    
    @IBAction func plus(_ sender: UIButton) {
        let cal = calcTab(operand)
        print("cal is \(cal)")
        operand = "+"
        justno1=""
        viewLoad.text = (cal != "") ? resultFormatter(cal) : ""
        operand1 = true
    }
    
    
    @IBAction func four(_ sender: UIButton) {
        addValue("4")
    }
    
    
    @IBAction func five(_ sender: UIButton) {
        addValue("5")
    }
    
    @IBAction func six(_ sender: UIButton) {
        addValue("6")
    }
    
    @IBAction func minus(_ sender: UIButton) {
            if(no1 == ""){
            no1 = "0"
        }
        let cal = calcTab(operand)
        print("cal is \(cal)")
        operand = "-"
        justno1=""
        viewLoad.text = (cal != "") ? resultFormatter(cal) : ""
        operand1 = true
    }
    
    @IBAction func seven(_ sender: UIButton) {
       addValue("7")
    }
    
    
    @IBAction func eight(_ sender: UIButton) {
        addValue("8")
    }
    
    
    @IBAction func nine(_ sender: UIButton) {
        addValue("9")
    }
    
    
    @IBAction func multi(_ sender: UIButton) {
         let cal = calcTab(operand)
        print("cal is \(cal)")
        operand = "*"
        justno1=""
        viewLoad.text = (cal != "") ? resultFormatter(cal) : ""
         
        operand1 = true
    }
    
   
    @IBAction func percent(_ sender: UIButton) {
        let cal = calcTab(operand)
        print("cal is \(cal)")
        operand = "%"
        justno1=""
        viewLoad.text = (cal != "") ? resultFormatter(cal) : ""
         
        operand1 = true
    }
    
    
    
    
    
    
    
    
    
    
    
}

