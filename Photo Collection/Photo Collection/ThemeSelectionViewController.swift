//
//  ThemeSelectionViewController.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectBlueTheme(_ sender: UIButton) {
        themeHelper.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
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
