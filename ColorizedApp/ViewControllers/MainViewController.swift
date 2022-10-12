//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Айтолкун Анарбекова on 12/10/22.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setSettingsBackground(to color: UIColor)
}

class MainViewController: UIViewController {

    var settingsController: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
    }

}
    
    

