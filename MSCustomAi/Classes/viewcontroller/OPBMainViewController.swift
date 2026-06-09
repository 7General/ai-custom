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

        view.addSubview(descLabel)
        view.addSubview(calculateFeeButton)
    }

    func setupLayout() {

        descLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        calculateFeeButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }

    func setupAction() {
        calculateFeeButton.addTarget(self, action: #selector(didTapCalculateFee), for: .touchUpInside)
    }

    func setupStyle() {
        
    }
    // 待定

    @objc private func didTapCalculateFee() {
        let request = OPBCalculateFeeRequest()
        // TODO: 填入实际参数
        request.scanId = ""
        request.orderAmount = ""
        OPBNetworkManager.shared.send(request) { (response: OPBCalculateFeeResponse?, error) in
            if let error = error {
                debugPrint("calculateFee error: \(error)")
                return
            }
            debugPrint("calculateFee response: \(String(describing: response))")
        }
    }

}

// MARK: - Lazy

extension OPBMainViewController {

   

    

    private lazy var descLabel: UILabel = {
        let it = UILabel()
        it.font = UIFont.systemFont(ofSize: 14)
        it.theme_textColor = MSThemeHelper.blackTheme65
        return it
    }()

    private lazy var calculateFeeButton: UIButton = {
        let it = UIButton(type: .system)
        it.setTitle("计算税费", for: .normal)
        it.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        it.setTitleColor(.white, for: .normal)
        it.layer.cornerRadius = 8
        return it
    }()

}
