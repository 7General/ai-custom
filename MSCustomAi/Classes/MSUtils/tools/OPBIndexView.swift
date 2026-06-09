//
//  OPBIndexView.swift
//  MSCustomAi
//

import UIKit
import SnapKit
import SwiftTheme

class OPBIndexView: UIView {

    var indexLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupLayout()
        setupStyle()
    }

    private func setupUI() {
        addSubview(indexLabel)
    }

    private func setupLayout() {
        indexLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
    }

    private func setupStyle() {
        theme_backgroundColor = MSThemeHelper.mainWhiteTheme
        indexLabel.font = UIFont.systemFont(ofSize: 16)
        indexLabel.theme_textColor = MSThemeHelper.blackTheme
    }

    func configure(index: Int) {
        indexLabel.text = "Row \(index)"
    }
}
