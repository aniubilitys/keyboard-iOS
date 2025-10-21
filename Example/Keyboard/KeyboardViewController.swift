//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Aloner on 2025/10/10.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(contentView)

        let installer = UIButton(type: .custom)
        installer.setTitle("Allow Full Access", for: .normal)
        installer.setTitleColor(.systemBlue, for: .normal)

        installer.frame = .init(x: UIScreen.main.bounds.width / 2 - 100, y: 100, width: 200, height: 40)
        view.addSubview(installer)
        installer.addTarget(self, action: #selector(keyboardInstall), for: .touchUpInside)
                // Do any additional setup after loading the view.

        
    }
    @objc func keyboardInstall(){
        ExTouch.open()
    }
    
    lazy var contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        mainConstraint(contentView, tosuperView:self.view)

        
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {

    }

    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        layout(self)
    }

     func mainConstraint(_ view: UIView, tosuperView superView: UIView) {

         superView.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .top,
            relatedBy: .equal,
            toItem: superView,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        ))
        
        superView.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .left,
            relatedBy: .equal,
            toItem: superView,
            attribute: .left,
            multiplier: 1.0,
            constant: 0.0
        ))
        
        superView.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: superView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0
        ))
        
        superView.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .right,
            relatedBy: .equal,
            toItem: superView,
            attribute: .right,
            multiplier: 1.0,
            constant: 0.0
        ))
    }

    
    func layout(_ ctr: KeyboardViewController) {
        guard let superview = ctr.view.superview,let view = self.view else { return }
       
        CATransaction.begin()
        CATransaction.setDisableActions(true)

       superview.addConstraint(NSLayoutConstraint(
           item: view,
           attribute: .left,
           relatedBy: .equal,
           toItem: superview,
           attribute: .left,
           multiplier: 1.0,
           constant: 0.0
       ))
       
       superview.addConstraint(NSLayoutConstraint(
           item: view,
           attribute: .right,
           relatedBy: .equal,
           toItem: superview,
           attribute: .right,
           multiplier: 1.0,
           constant: 0.0
       ))
       
       superview.addConstraint(NSLayoutConstraint(
           item: view,
           attribute: .top,
           relatedBy: .equal,
           toItem: superview,
           attribute: .top,
           multiplier: 1.0,
           constant: 0.0
       ))
       
       ctr.view.addConstraint(NSLayoutConstraint(
           item: view,
           attribute: .width,
           relatedBy: .equal,
           toItem: nil,
           attribute: .notAnAttribute,
           multiplier: 1.0,
           constant: UIScreen.main.bounds.width
       ))
       
           ctr.view.addConstraint(NSLayoutConstraint(
               item: view,
               attribute: .height,
               relatedBy: .equal,
               toItem: nil,
               attribute: .notAnAttribute,
               multiplier: 1.0,
               constant: 220
           ))
        
        CATransaction.commit()

   }
}
