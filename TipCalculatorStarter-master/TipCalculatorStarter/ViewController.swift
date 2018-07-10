//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var inputCardViewer: UIView!
    
    @IBOutlet weak var tipPercentSegmentedControl: UIStackView!

    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            if self.billAmountTextField.isFirstResponder {
                self.billAmountTextField.resignFirstResponder()
            }
            guard let billAmountText = self.billAmountTextField.text,
                let billAmount = Double(billAmountText) else {
                    return
            }
            
            let roundedBillAmount = (100 * billAmount).rounded() / 100
            
            let tipPercent = 0.15
            let tipAmount = roundedBillAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
            self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
            
            print("Bill Amount: \(roundedBillAmount)")
            print("Tip Amount: \(roundedTipAmount)")
            print("Total Amount: \(totalAmount)")
        }
        func calculate() {
            if self.billAmountTextField.isFirstResponder {
                self.billAmountTextField.resignFirstResponder()
            }
            guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                return
            }
            let roundedBillAmount = (100 * billAmount).rounded() / 100
            
            var tipPercent = Double
            switch tipPercentSegmentedControl.selectedSegemntIndex {
            case 0:
                tipPercent = 0.15
            case 1:
                tipPercent = 0.18
            case 2:
                tipPercent = 0.20
            default:
                preconditionFailure("Unexpected index.")
            }
            let tipAmount = roundedBillAmount * tipPercent
            let roundedTipAmount = (100 * tipAmount).rounded() / 100
            
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
            self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
        }
    }
    @IBOutlet weak var ouputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset button tapped")
    }
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("switch toggled on")
        } else {
            print("switch toggle off")
        }
    }
    


}
