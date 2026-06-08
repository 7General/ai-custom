//
//  ViewController.swift
//  MSCustomAi
//
//  Created by huizhou.wang on 06/08/2026.
//  Copyright (c) 2026 huizhou.wang. All rights reserved.
//

import UIKit
import SwiftTheme

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Hello MSCustomAi"
        label.font = UIFont.systemFont(ofSize: 16)
        label.theme_textColor = MSThemeHelper.blackTheme85
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let label2 = UILabel()
        label2.text = "Hello Label2"
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.theme_textColor = MSThemeHelper.blackTheme65
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])

        let tapImageView = MSTapImageView()
        tapImageView.image = UIImage(named: "placeholder")
        tapImageView.contentMode = .scaleAspectFill
        tapImageView.isUserInteractionEnabled = true
        tapImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tapImageView)
        NSLayoutConstraint.activate([
            tapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapImageView.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 100),
            tapImageView.widthAnchor.constraint(equalToConstant: 100),
            tapImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        tapImageView.tapHandler = { [weak self] in
            print("tapImageView tapped!")
        }

        let label3 = UILabel()
        label3.text = "Hello Label3"
        label3.font = UIFont.systemFont(ofSize: 16)
        label3.theme_textColor = MSThemeHelper.blackTheme45
        label3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label3)
        NSLayoutConstraint.activate([
            label3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label3.topAnchor.constraint(equalTo: tapImageView.bottomAnchor, constant: 20)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

