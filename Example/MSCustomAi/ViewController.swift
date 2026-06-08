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

var _tt = "ddd"
var ___tt2 = "666"
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 20, y: 100, width: 200, height: 44)
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.theme_textColor = MSThemeHelper.mainColor
        return label
    }()

    func __t() {

    }

    func __t2() {
        
    }

    lazy var containerView: UIView = {
        let itssss = UIView()
        
        return itssss
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

