//
//  Extensions.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit

extension UIView {
    func dropCardShadow(radius: CGFloat = 1, opacity: Float = 2 , shadowColor:UIColor = UIColor.black){
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height:  radius)
        self.layer.shadowRadius =  radius
    }
    
    func addCornerRadius(cornerRadius: CGFloat = 5){
        self.layer.cornerRadius = cornerRadius
    }
}
// MARK: Helper Extensions
extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
