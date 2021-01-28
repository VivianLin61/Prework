//
//  SettingsViewController.swift
//  Prework
//
//  Created by Vivian Lin on 1/28/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var newTipPercentages = [0.15, 0.18, 0.2];
    var darkMode = false

    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton;
        self.title = "Settings"
        setDarkMode()
        tip1.text = String(format: "%02d%%", Int(newTipPercentages[0] * 100))
        tip2.text = String(format: "%02d%%", Int(newTipPercentages[1] * 100))
        tip3.text = String(format: "%02d%%", Int(newTipPercentages[2] * 100))
        // Do any additional setup after loading the view.
        
    }
    func setDarkMode() {
        if darkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        // Perform your custom actions
        let firstTip = Int(tip1.text!.dropLast(1))!
        let secondTip = Int(tip2.text!.dropLast(1))!
        let thirdTip = Int(tip3.text!.dropLast(1))!
        // Go back to the previous ViewController
        newTipPercentages = [(Double(firstTip)/100.0),(Double(secondTip)/100.0),(Double(thirdTip)/100.0)]
        performSegue(withIdentifier: "updateTips", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.tipPercentages = newTipPercentages
        vc.darkMode = darkMode
    }
    @IBAction func toggledDarkMode(_ sender: Any) {
        darkMode.toggle()
        let defaults = UserDefaults.standard
        defaults.set(darkMode, forKey: "DarkMode")
        if darkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        
    }
    /*
    // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
