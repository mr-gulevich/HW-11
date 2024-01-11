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

        //shadow adding
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

    private lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "enter your password"
        textField.setLeftIcon(UIImage(named: "lock")!)
        textField.isSecureTextEntry = true

        //shadow adding
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

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        let loginButtonColor = UIColor(red: 0.43, green: 0.47, blue: 0.8, alpha: 0.9)
        button.backgroundColor = loginButtonColor
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)

        //shadow adding
        button.layer.cornerRadius = 30
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var forgotPasswordLink: UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forgotPassword)))
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        //set delegate and selector for fields Name and Password
        textFieldName.delegate = self
        textFieldName.addTarget(self, action: #selector(fieldFilled(_:)), for: .editingChanged)

        textFieldPassword.delegate = self
        textFieldPassword.addTarget(self, action: #selector(fieldFilled(_:)), for: .editingChanged)

        setupHierachy()
        setupLayout()
    }

    //MARK: - Setup

    private func setupHierachy() {
        view.addSubview(labelLogin)
        view.addSubview(textFieldName)
        view.addSubview(textFieldPassword)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLink)
    }

    private func setupLayout() {

        //Login label constraits
        labelLogin.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Name field constraits
        textFieldName.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 30).isActive = true
        textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        textFieldName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        textFieldName.heightAnchor.constraint(equalToConstant: 60).isActive = true

        //Password field constraits
        textFieldPassword.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 30).isActive = true
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        textFieldPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: 60).isActive = true

        //Login button constraits
        loginButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        //Forgot Password link constraint
        forgotPasswordLink.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        forgotPasswordLink.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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

    @objc func forgotPassword() {
        textFieldPassword.text = "123"
    }
}


extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let leftIconView = UIImageView(frame: CGRect(x: 30, y: 5, width: 22, height: 20))
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

