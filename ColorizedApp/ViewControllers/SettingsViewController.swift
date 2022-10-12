//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Айтолкун Анарбекова on 25/9/22.
//

import UIKit

protocol MainViewControllerDelegate {
    func setBackground(to color: UIColor)
}

class SettingsViewController: UIViewController, SettingsViewControllerDelegate {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    var mainViewController: MainViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        
        
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )

        sliderValueToLabelText()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        

        
    }
    
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        sliderValueToLabelText()
        
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )

        
    }
    
    @IBAction func doneButton() {
         mainViewController?.setBackground(to: UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        ))
        dismiss(animated: true)
    }
    
    
    
    
    private func sliderValueToLabelText() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    func setSettingsBackground(to color: UIColor) {
        coloredView.backgroundColor = color
        
    }
    
}



extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
 
        redLabel.text = redTextField.text
        greenLabel.text = greenTextField.text
        blueLabel.text = blueTextField.text
        
        redSlider.value = Float(redTextField.text ?? "0") ?? 0
        greenSlider.value = Float(greenTextField.text ?? "0") ?? 0
        blueSlider.value = Float(blueTextField.text ?? "0") ?? 0
        
    }
    
    
}
// MARK: SettingsViewControllerDelegate

extension SettingsViewController: MainViewControllerDelegate {
    func setBackground(to color: UIColor) {
       let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}

