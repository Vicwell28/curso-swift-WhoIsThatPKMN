//
//  UIViewShowLifeCycle+Extension.swift
//  who is that pokemon
//
//  Created by soliduSystem on 22/02/23.
//

import UIKit

extension UIViewController {
    public func showLifecycle(_ lifeCicle : String, for viewController : String) -> Void{
        print("""
        \n\n\n
        /----------------------------------------------------------/
        /---                                                    ---/
        /--- \(viewController)
        /--- \(lifeCicle)
        /---                                                    ---/
        /----------------------------------------------------------/
        """)
    }
}
