//
//  CPCustomView.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit

@IBDesignable
class CPCustomView : UIView {
    // MARK: - IBInspectable
    @IBInspectable
    var borderNewColor:UIColor  = UIColor.clear
    
    @IBInspectable
    var cornerRadius:CGFloat  = 4
    
    @IBInspectable
    var borderWidth :CGFloat  = 3.0
    
    // MARK: - Methods
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.borderColor = borderNewColor.cgColor
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
    }
    
    
}
