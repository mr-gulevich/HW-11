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

    private lazy var separatorName: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var separatorLeft: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var separatorRight: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        let facebookColor = UIColor(red: 0.26, green: 0.63, blue: 0.92, alpha: 0.95)
        button.backgroundColor = facebookColor
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        button.setLeftIcon(UIImage(named: "facebook")!)

        //shadow adding
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        let twitterColor = UIColor(red: 0.33, green: 0.44, blue: 0.69, alpha: 0.95)
        button.backgroundColor = twitterColor
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        button.setLeftIcon(UIImage(named: "twitter")!)

        //shadow adding
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Dont have account?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var signUpLink: UILabel = {
        let label = UILabel()
        label.text = "Sign up"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        let linkColor = UIColor(red: 0.33, green: 0.44, blue: 0.69, alpha: 0.95)
        label.textColor = linkColor
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
        view.addSubview(separatorName)
        view.addSubview(separatorLeft)
        view.addSubview(separatorRight)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpLink)
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

        //Separator constraints
        separatorName.topAnchor.constraint(equalTo: forgotPasswordLink.bottomAnchor, constant: 100).isActive = true
        separatorName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        separatorLeft.centerYAnchor.constraint(equalTo: separatorName.centerYAnchor, constant: 0).isActive = true
        separatorLeft.rightAnchor.constraint(equalTo: separatorName.leftAnchor, constant: -10).isActive = true
        separatorLeft.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        separatorLeft.heightAnchor.constraint(equalToConstant: 1).isActive = true

        separatorRight.centerYAnchor.constraint(equalTo: separatorName.centerYAnchor, constant: 0).isActive = true
        separatorRight.leftAnchor.constraint(equalTo: separatorName.rightAnchor, constant: 10).isActive = true
        separatorRight.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        separatorRight.heightAnchor.constraint(equalToConstant: 1).isActive = true

        //Facebook button constraints
        facebookButton.topAnchor.constraint(equalTo: separatorName.bottomAnchor, constant: 20).isActive = true
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        //Twitter button constraints
        twitterButton.topAnchor.constraint(equalTo: separatorName.bottomAnchor, constant: 20).isActive = true
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        //Sign up constraints
        signUpLabel.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 40).isActive = true
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true

        signUpLink.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 40).isActive = true
        signUpLink.leftAnchor.constraint(equalTo: signUpLabel.rightAnchor, constant: 15).isActive = true
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

extension UIButton {
    func setLeftIcon(_ image: UIImage) {
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftIconView.image = image

        let iconContainerView = UIView(frame: CGRect(x: 20, y: 10, width: 50, height: 30))
        iconContainerView.addSubview(leftIconView)

        self.imageView?.contentMode = .left
        self.setImage(UIImage(), for: .normal)
        self.addSubview(iconContainerView)
    }
}
