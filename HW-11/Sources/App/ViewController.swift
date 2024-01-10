//
//  ViewController.swift
//  HW-11
//
//  Created by Gulevich Aliaksei on 10.01.24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets

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

    }

    private func setupLayout() {

    }

    //MARK: - Actions




}
