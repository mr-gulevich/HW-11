//
//  ViewController.swift
//  HW-11
//
//  Created by Gulevich Aliaksei on 10.01.24.
//

import UIKit

class ViewController: UIViewController {

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

    //MARK: - Lifestyle

    override func viewDidLoad() {
    super.viewDidLoad()

    let imageView = UIImageView(frame: self.view.bounds)
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage(named: "backView")
    self.view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)

    setupHierachy()
    setupLayout()
}

    //MARK: - Setup

    private func setupHierachy() {
        view.addSubview(labelLogin)
    }

    private func setupLayout() {
        labelLogin.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

    //MARK: - Actions




}
