//
//  ViewController.swift
//  Example
//
//  Created by Aloner on 2025/10/10.
//

import UIKit

class ViewController: UIViewController {

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let installer = UIButton(type: .custom)
        installer.setTitle("install", for: .normal)
        installer.setTitleColor(.systemBlue, for: .normal)

        installer.frame = .init(x: UIScreen.main.bounds.width / 2 - 50, y: 200, width: 100, height: 40)
        view.addSubview(installer)
        installer.addTarget(self, action: #selector(keyboardInstall), for: .touchUpInside)

    }
    
    @objc func keyboardInstall(){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }


}

