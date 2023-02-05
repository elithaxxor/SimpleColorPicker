//
//  ViewController.swift
//  SimpleColorPickerII
//
//  Created by Adel Al-Aali on 2/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    // constants for color picker
    private var colorPicker = UIColorPickerViewController()
    private var selectedColor = UIColor.systemRed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        view.backgroundColor = selectedColor 
    }
    
    // colocker picker controller / present
    fileprivate func selectColor() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor  = selectedColor
        present(colorPicker, animated: true)
    }
    
    // setup action with UIAction()
    private func setupBarButton() {
        
        let config = UIAction(title: "choose color") { _ in
            self.selectedColor
        }
        
        let pickColorBarButton = UIBarButtonItem(image: UIImage(systemName: "eyedropper"), primaryAction: config)
        navigationItem.rightBarButtonItem = pickColorBarButton
    }

}

//  picker-->   Informs the delegate when a person selects a color, indicating whether the update is part of a continuous user interaction.}

// did select--> Informs the delegate that the user dismissed the view controller.
extension ViewController : UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        selectedColor = viewController.selectedColor
        view.backgroundColor = selectedColor
        print("user initiated color picker \(viewController.selectedColor)")
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        print("user dismissed colorpicker controller \(viewController.selectedColor)")
    }
}
