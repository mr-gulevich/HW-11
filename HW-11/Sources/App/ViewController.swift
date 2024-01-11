//
//  ViewController.swift
//  HW-11
//
//  Created by Gulevich Aliaksei on 10.01.24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets

    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var textFieldName: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "enter your name"

        textField.setLeftIcon(UIImage(named: "man")!)

        textField.layer.cornerRadius = 30
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.3
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 10
        textField.layer.shouldRasterize = true
        textField.layer.rasterizationScale = UIScreen.main.scale
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    

    //MARK: - Lifestyle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background setup
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "backView")
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        textFieldName.delegate = self
        textFieldName.addTarget(self, action: #selector(fieldFilled(_:)), for: .editingChanged)

        setupHierachy()
        setupLayout()
    }

    //MARK: - Setup

    private func setupHierachy() {
        view.addSubview(labelLogin)
        view.addSubview(textFieldName)
    }

    private func setupLayout() {
        labelLogin.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textFieldName.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 30).isActive = true
        textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        textFieldName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        textFieldName.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    //MARK: - Actions

    @objc func fieldFilled(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty {
            sender.setRightIcon(UIImage(named: "success")!)
        } else {
            sender.rightView = nil
            sender.rightViewMode = .never
        }
    }
}


extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let leftIconView = UIImageView(frame: CGRect(x: 30, y: 5, width: 25, height: 20))
        leftIconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 10, y: 20, width: 60, height: 30))
        iconContainerView.addSubview(leftIconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage) {
        let rightIconView = UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
        rightIconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        iconContainerView.addSubview(rightIconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}

