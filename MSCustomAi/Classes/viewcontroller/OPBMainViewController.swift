//
//  OPBMainViewController.swift
//  MSCustomAi
//
//  Created by huizhou.wang on 2026/06/09.
//

import UIKit
import SnapKit
import SwiftTheme

public class OPBMainViewController: OPBUIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupAction()
        setupStyle()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        debugPrint("OPBMainViewController======dealloc")
    }

}

// MARK: - Setup

extension OPBMainViewController {

    func setupUI() {
        view.addSubview(titleLabel)
    }

    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupAction() {}

    func setupStyle() {
        view.theme_backgroundColor = OPBThemeHelper.backgroundColorPicker()
        titleLabel.theme_textColor = OPBThemeHelper.titleColorPicker()
    }

}

// MARK: - Lazy

extension OPBMainViewController {

    private lazy var titleLabel: UILabel = {
        let it = UILabel()
        it.text = "MSCustomAi"
        it.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        it.textAlignment = .center
        return it
    }()

}
