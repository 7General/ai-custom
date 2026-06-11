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

    var scanId: String = ""
    var orderAmount: String = ""

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

   /// 添加待定
    func setupStyle() {
        
    }
    // 待定

    @objc private func didTapCalculateFee() {
        let request = OPBUpdateNotificationSettingsRequest()
        request.pushEnabled = true
        OPBNetworkManager.shared.start(request) { [weak self] request, data, error in
            guard let `self` = self else { return }
            guard let entity = OPBUpdateNotificationSettingsResponse.jsonToModel(data as Any, modelType: OPBUpdateNotificationSettingsResponse.self) as? OPBUpdateNotificationSettingsResponse else {
                return
            }
            if entity.isNormalData() {

            } else {

            }
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
