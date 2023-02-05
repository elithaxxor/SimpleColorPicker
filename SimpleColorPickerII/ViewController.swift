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
    
    // gesture recognizer
    
    
    private var button :  UIButton = {
    button.setTitle("Tap Me", for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 200, height: 50 )
    button.center = view.center
    view.addSubView(button)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        view.backgroundColor = selectedColor
        
        let gesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(gesterConfig))
        gesterRecognizer.direction = .right
        gesterRecognizer.numberOfTouches = 1
        view.addGestureRecognizer(gesterRecognizer)
        gesterRecognizer.view?.isUserInteractionEnabled = true
        
        
        button.addTarget(self, action: #selector(didTapBtn), for : .touchUpInside)

    }
    
    @objc private func gestureConfig() {
        let config = gesture.view
        config?.backgroundColor = .cyan
        
        
    }
    
    @objc private func didTapBtn() {
        let vc = SecondVC()
        present(vc, animated: true)
    }
    
    
    private func setupBarButtonItem() {
        let config = UIAction(title: "") { action in
            print("running save function, user actived")
        }
        
        let saveMenu = UIMenu(title : "Copy", children: [
            UIAction(title: "copy", image: UIImage(systemName: "doc.on.doc")) { action in
                print("copy action used")
                // ADD CODE HERE
            },
            UIAction(title: "rename", image: UIImage(systemName: "pencil")) action in {
                print("rename action used")
                // ADD CODE HERE
            },
            UIAction(title: "duplicate", image: UIImage(systemName: "plus.square.on.square")) action in {
                print("duplicate action used")
                
            },
            UIAction(title: "duplicate", image: UIImage(systemName: "folder")) action in {
                
            },
        ])
        
        let saveBtn = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), primaryAction: saveAction, menu: saveMenu)
        navigationItem.rightBarButtonItem = saveBtn
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



/// card view that pops up
class MyView : UIViewController {
    
    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "login"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let username : UITextField = {
        let textField = UITextField()
        
    }()
    
    var vc : UIViewController?
    init (vc: UIViewController) {
        self.vc = vc
        super.init(coder: .)
    }
    required init?(coder : NSCoder) {
        fatalError()
    }
}


class SecondVC : UIViewController {
    
    var myView : MyView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        myView = MyView(vc: self)
        
    }
}
