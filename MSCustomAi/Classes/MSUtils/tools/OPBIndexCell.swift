//
//  OPBIndexCell.swift
//  MSCustomAi
//

import UIKit
import SnapKit

class OPBIndexCell: UITableViewCell {

    private lazy var indexView: OPBIndexView = {
        let it = OPBIndexView()
        return it
    }()
// 9999------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(indexView)
        indexView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(index: Int) {
        indexView.configure(index: index)
    }
}
