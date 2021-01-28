//
//  ViewController.swift
//  Prework
//
//  Created by Vivian Lin on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var rateLabel: UILabel!
    

    var tipPercentages = [0.15, 0.18, 0.2];
    var rate = 0.0
    
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        tipControl.setTitle(String(format: "%02d%%", Int(tipPercentages[0] * 100)), forSegmentAt: 0);
        tipControl.setTitle(String(format: "%02d%%", Int(tipPercentages[1] * 100)), forSegmentAt: 1);
        tipControl.setTitle(String(format: "%02d%%", Int(tipPercentages[2] * 100)), forSegmentAt: 2);
        rate = tipPercentages[0]
        tipPercentageSlider.setValue(Float(rate * 100), animated: true)
        rateLabel.text = String(format: "%02d%%", Int(tipPercentageSlider.value))
        billAmountTextField.addTarget(self, action: #selector(ViewController.billAmountTextFieldDidChange(_:)), for: .editingChanged)
    
        // Do any additional setup after loading the view.
    }
    
    @objc func billAmountTextFieldDidChange(_ textField: UITextField) {
        calculateBill()
    }
    
    func calculateBill() {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * rate
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    

    @IBAction func tipControlValueChanged(_ sender: Any) {
        rate = tipPercentages[tipControl.selectedSegmentIndex]
        tipPercentageSlider.setValue(Float(rate * 100), animated: true)
        rateLabel.text = String(format: "%02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }


    @IBAction func tipSlideValueChanged(_ sender: Any) {
        rate = Double(tipPercentageSlider.value/100.0)
        rateLabel.text = String(format: "%02d%%", Int(tipPercentageSlider.value))
        calculateBill()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SettingsViewController
        vc.newTipPercentages = tipPercentages
    }
    
}

