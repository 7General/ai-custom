//
//  ViewController.swift
//  MSCustomAi
//
//  Created by huizhou.wang on 06/08/2026.
//  Copyright (c) 2026 huizhou.wang. All rights reserved.
//

import UIKit
import SwiftTheme
import SnapKit

class ViewController: UIViewController {

    private let dataCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(OPBIndexCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private lazy var tableView: UITableView = {
        let it = UITableView()
        it.delegate = self
        it.dataSource = self
        it.theme_backgroundColor = ThemeColorPicker(colors: "#FFFFFFFF", "#00000073")
        return it
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OPBIndexCell
        cell.configure(index: indexPath.row)
        return cell
    }

}

