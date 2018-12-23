//
//  UIControl+addAction.swift
//  Cingulo
//
//  Created by Cíngulo on 21/05/2018.
//  Copyright © 2018 Codigo da Mente Edicao E Comercio De Livros E Testes. All rights reserved.
//

import UIKit
extension UIControl {
    public func addAction(for controlEvents: UIControl.Event = .primaryActionTriggered, action: @escaping () -> Void) {
        let sleeve = MLClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(MLClosureSleeve.invoke), for: controlEvents)
    }
}
