//
//  VSConfiguration.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit

//MARK: - VSAlertConfiguration
public struct VSAlertConfiguration {
    public var titleFont:UIFont = UIFont.systemFont(ofSize: 17, weight: .bold)
    public var messageFont:UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    public var titleColor:UIColor = .black
    public var messageColor:UIColor = .black
    public var activityColor:UIColor = .black
    public var alertBackgroundColor:UIColor = .white
    
    public var showActivity:Bool = false
    
    public var cornerRadius:CGFloat = 16
    
    public static var config:VSAlertConfiguration = VSAlertConfiguration()
}
 
 
//MARK: - VSAlertActionConfiguration
public struct VSAlertActionConfiguration {
    var font:UIFont = .systemFont(ofSize: 17, weight: .bold)
    public var forgroundColor:UIColor = .black
    public var backgroundColor:UIColor = .white
    public var cornerRadius:CGFloat = 8
    
    public static var config:VSAlertActionConfiguration = VSAlertActionConfiguration()
}
