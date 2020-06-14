//
//  PaddedTextField.swift
//  Programmatic-ScrollView-Login
//
//  Created by Audrey Welch on 6/13/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit

@objc public class PaddedTextField: UITextField {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - create it programmatically")
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
}
