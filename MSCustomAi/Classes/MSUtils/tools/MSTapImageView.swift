//
//  MSTapImageView.swift
//  MSCustomAi
//
//  Created by zz on 8.6.26.
//

import UIKit

class MSTapImageView: UIImageView {
    public var tapHandler:(()->Void)?
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let handler = tapHandler else { return }
        handler()
    }
}
