//
//  ViewController.swift
//  DaTip
//
//  Created by Sebastian Muehl on 2/5/17.
//  Copyright © 2017 Sebastian Muehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var sumPay: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var enterNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        //Set labels to alpha 0 until they have value
        tipAmount.alpha = 0.0
        sumPay.alpha = 0.0
        enterNumber.alpha = 0.0
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UISegmentedControl) {
        
        let bill = Double(billAmount.text!)
        
        //If user just enters dots "...." it should not go to switch
        
        if bill != nil {
            
            switch sender.selectedSegmentIndex {
            case 0:
                tipAmount.alpha = 0.0
                sumPay.alpha = 0.0
                tipAmount.text = String(format: "%.2f",(bill! * 0.15))
                sumPay.text = String(format: "%.2f",((bill! * 0.15) + bill!))
            case 1:
                tipAmount.alpha = 0.0
                sumPay.alpha = 0.0
                tipAmount.text = String(format: "%.2f",(bill! * 0.18))
                sumPay.text = String(format: "%.2f",((bill! * 0.18) + bill!))
            case 2:
                tipAmount.alpha = 0.0
                sumPay.alpha = 0.0
                tipAmount.text = String(format: "%.2f",(bill! * 0.20))
                sumPay.text = String(format: "%.2f",((bill! * 0.20) + bill!))
            default:
                break;
            }  //Switch
            // Fade in tip
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.tipAmount.alpha = 1.0
            }, completion: nil)
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.sumPay.alpha = 1.0
            }, completion: nil)
            
            //Hide error if user corrects input
            enterNumber.alpha = 0.0
            
        } else {
            // Fade in error message
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.enterNumber.alpha = 1.0
            }, completion: nil)
            
            tipAmount.alpha = 0.0
            sumPay.alpha = 0.0
            
            
        }
    }
    
    
}



