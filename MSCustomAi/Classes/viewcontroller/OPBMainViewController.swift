//
//  OPBMainViewController.swift
//  MSCustomAi
//
//  Created by huizhou.wang on 2026/06/09.
//

// [TODO-Color] 缺少语义化颜色：浅色 #098793 / 暗黑 待定
// 建议在 MSThemeHelper 中补充：
// public static let xxx : MSThemeColor = MSThemeColor("#098793", "#098793")

import UIKit
import SnapKit
import SwiftTheme

public class OPBMainViewController: OPBUIViewController {

    // MARK: - 生命周期

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupAction()
        setupStyle()
    }
    var infoLabel = UILabel()

    deinit {
        NotificationCenter.default.removeObserver(self)
        debugPrint("OPBMainViewController======dealloc")
    }

}

// MARK: - 设置

extension OPBMainViewController {

    func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(phoneContainerView)
        phoneContainerView.addSubview(areaCodeLabel)
        phoneContainerView.addSubview(phoneSeparatorView)
        phoneContainerView.addSubview(phoneTextField)
        view.addSubview(passwordContainerView)
        passwordContainerView.addSubview(passwordTextField)
        passwordContainerView.addSubview(togglePasswordButton)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(infoLabel)
    }

    func setupLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(48)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
        }

        phoneContainerView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(52)
        }

        areaCodeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
        }

        phoneSeparatorView.snp.makeConstraints { make in
            make.leading.equalTo(areaCodeLabel.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(20)
        }

        phoneTextField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(phoneSeparatorView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }

        passwordContainerView.snp.makeConstraints { make in
            make.top.equalTo(phoneContainerView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(52)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(togglePasswordButton.snp.leading).offset(-8)
        }

        togglePasswordButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainerView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(52)
        }

        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
    }

    func setupAction() {
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        togglePasswordButton.addTarget(self, action: #selector(didTapTogglePassword), for: .touchUpInside)
    }

    func setupStyle() {
        view.theme_backgroundColor = MSThemeHelper.mainBackColor
        phoneContainerView.theme_backgroundColor = MSThemeHelper.mainWhiteTheme
        passwordContainerView.theme_backgroundColor = MSThemeHelper.mainWhiteTheme
        infoLabel.theme_backgroundColor = ThemeColorPicker(colors: "#098793", "#098793")
        updateLoginButtonState()
    }

}

// MARK: - 按钮事件

extension OPBMainViewController {

    @objc private func didTapLogin() {
        guard let phone = phoneTextField.text, !phone.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else { return }

        view.showHUDIndicatorAtCenter()

        let request = OPBLoginRequest()
        request.phone = phone
        request.password = password

        OPBNetworkManager.shared.start(request) { [weak self] request, data, error in
            guard let `self` = self else { return }
            self.view.hiddenHUDIndicatorAtCenter()

            guard let entity = OPBLoginResponse.jsonToModel(data as Any, modelType: OPBLoginResponse.self) as? OPBLoginResponse else {
                return
            }

            if entity.isNormalData() {
                UserDefaults.standard.set(entity.token, forKey: "opb_login_token")
                UserDefaults.standard.set(entity.userId, forKey: "opb_login_userId")
                OPNewRouterManager.openURL("opay://home", userInfo: nil)
            } else {
                self.view.showHUDText(entity.errorMessage)
            }
        }
    }

    @objc private func didTapForgotPassword() {
        OPNewRouterManager.openURL("opay://forgot_password", userInfo: nil)
    }

    @objc private func didTapTogglePassword() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @objc private func textFieldDidChange() {
        updateLoginButtonState()
    }

}

// MARK: - 私有方法

extension OPBMainViewController {

    private func updateLoginButtonState() {
        let enabled = !(phoneTextField.text?.isEmpty ?? true) && !(passwordTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = enabled
        loginButton.theme_backgroundColor = enabled ? MSThemeHelper.mainColor : MSThemeHelper.mainEnableColor
    }

}

// MARK: - 懒加载

extension OPBMainViewController {

    private lazy var logoImageView: UIImageView = {
        let it = UIImageView()
        it.contentMode = .scaleAspectFit
        // TODO: 替换为实际 Logo 图片名
        return it
    }()

    private lazy var phoneContainerView: UIView = {
        let it = UIView()
        it.layer.cornerRadius = 8
        it.clipsToBounds = true
        return it
    }()

    private lazy var areaCodeLabel: UILabel = {
        let it = UILabel()
        it.text = "+86"
        it.font = UIFont.systemFont(ofSize: 16)
        it.theme_textColor = MSThemeHelper.blackTheme101
        it.textAlignment = .center
        return it
    }()

    private lazy var phoneSeparatorView: UIView = {
        let it = UIView()
        it.theme_backgroundColor = MSThemeHelper.blackTheme15
        return it
    }()

    private lazy var phoneTextField: UITextField = {
        let it = UITextField()
        it.keyboardType = .phonePad
        it.font = UIFont.systemFont(ofSize: 16)
        it.theme_textColor = MSThemeHelper.blackTheme85
        it.placeholder = "请输入手机号"
        return it
    }()

    private lazy var passwordContainerView: UIView = {
        let it = UIView()
        it.layer.cornerRadius = 8
        it.clipsToBounds = true
        return it
    }()

    private lazy var passwordTextField: UITextField = {
        let it = UITextField()
        it.isSecureTextEntry = true
        it.font = UIFont.systemFont(ofSize: 16)
        it.theme_textColor = MSThemeHelper.blackTheme85
        it.placeholder = "请输入密码"
        return it
    }()

    private lazy var togglePasswordButton: UIButton = {
        let it = UIButton(type: .system)
        it.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        it.theme_tintColor = MSThemeHelper.blackTheme45
        return it
    }()

    private lazy var loginButton: UIButton = {
        let it = UIButton(type: .system)
        it.setTitle("登录", for: .normal)
        it.theme_setTitleColor(MSThemeHelper.mainWhite01, forState: .normal)
        it.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        it.layer.cornerRadius = 8
        it.isEnabled = false
        return it
    }()

    private lazy var forgotPasswordButton: UIButton = {
        let it = UIButton(type: .system)
        it.setTitle("忘记密码", for: .normal)
        it.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        it.theme_setTitleColor(MSThemeHelper.blackTheme65, forState: .normal)
        return it
    }()

}
