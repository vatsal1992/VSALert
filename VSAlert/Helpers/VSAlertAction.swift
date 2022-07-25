//
//  VSAlertAction.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit

public struct VSAlertAction {
    private(set) var title:String = ""
    private(set) var style:VSAlertActionConfiguration = .config
    private(set) var completion:((Self)->Void)?
    
    public init(title t:String,actionStyle style:VSAlertActionConfiguration = .config,completionHandler callback:((Self)->Void)?) {
        self.title = t
        self.style = style
        self.completion = callback
    }
}

