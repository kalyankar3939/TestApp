//
//  File.swift
//  WhiteLabel
//
//  Created by The Appineers on 03/09/19.
//  Copyright © 2019 The Appineers. All rights reserved.
//


import Foundation
import UIKit
import Photos
import MessageUI
extension UIViewController  {
    
    
    /// Show Alert in the ViewController
    ///
    /// - Parameters:
    ///   - message: Message to be displayed in the Alert
    ///   - okAction: Closure To do after user clicks OK
    func showSimpleAlert(message:String, okAction: (() -> Void)? = nil)   {
        let alertController = UIAlertController(title: AppInfo.kAppName, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
            if let _ = okAction
            {
                okAction!()
            }
            
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func showSimpleActionSheet(controller: UIViewController,reportTitle:String?, blockTitle:String?, deleteTitle:String?, reportAction: (() -> Void)? = nil, blockAction: (() -> Void)? = nil, deleteAction: (() -> Void)? = nil) {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
            subview.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
            alert.view.tintColor = UIColor.black
            let color = UIColor.init(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
            if let reportTitle = reportTitle {
                let reportAlert = UIAlertAction(title: reportTitle, style: .default) { (action) in
                    if let reportAction = reportAction {
                        DispatchQueue.main.async(execute: {
                            reportAction()
                        })
                    }
                }
                reportAlert.setValue(color, forKey: "titleTextColor")
                alert.addAction(reportAlert)
            }
            
            if let blockTitle = blockTitle {
                let blockAlert = UIAlertAction(title: blockTitle, style: .default) { (action) in
                    if let blockAction = blockAction {
                        DispatchQueue.main.async(execute: {
                            blockAction()
                        })
                    }
                }
                blockAlert.setValue(color, forKey: "titleTextColor")
                alert.addAction(blockAlert)
            }
            
            if let deleteTitle = deleteTitle {
                let deleteAlert = UIAlertAction(title: deleteTitle, style: .default) { (action) in
                    if let deleteAction = deleteAction {
                        DispatchQueue.main.async(execute: {
                            deleteAction()
                        })
                    }
                }
                deleteAlert.setValue(color, forKey: "titleTextColor")
                alert.addAction(deleteAlert)
            }
            
            let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                print("User click Dismiss button")
            })
            cancelAlert.setValue(color, forKey: "titleTextColor")
            alert.addAction(cancelAlert)
            
            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        }
    
    
    /// Display Alert with options Yes or No
    ///
    /// - Parameters:
    ///   - msg: Message to be displayed in the alert
    ///   - ok: Text for Ok
    ///   - cancel: Text for cancel
    ///   - okAction:  Closure To do after user clicks OK
    ///   - cancelAction: Closure To do after user clicks Cancel
    func displayAlert( msg: String?, ok: String, cancel: String, okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil){
        
        let alertController = UIAlertController(title:  AppInfo.kAppName, message: msg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel)
        { (action) in
            if let cancelAction = cancelAction {
                DispatchQueue.main.async(execute: {
                    cancelAction()
                })
            }
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: ok, style: .default)
        { (action) in
            if let okAction = okAction {
                DispatchQueue.main.async(execute: {
                    okAction()
                })
            }
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    /// Call Option
    ///
    /// - Parameter phoneNumber: Phone Number
    func callNumber(phoneNumber:String) {
        if !phoneNumber.isEmpty {
            let aNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
            if let phoneCallURL:URL = URL(string:"tel://\(aNumber)") {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL )) {
                    if #available(iOS 10, *) {
                        application.open(phoneCallURL , options: [:], completionHandler: nil)
                    } else {
                        application.openURL(phoneCallURL);
                    }
                }
            }
        }
    }
    
    //topViewController function helps to find top most controller
    /// topViewController function helps to find top most controller
    ///
    /// - Parameter rootViewController: RootViewController of the window
    /// - Returns: TopView controller in the heirarchy
    class func topViewController(withRootViewController rootViewController: UIViewController) -> UIViewController {
        if (rootViewController is UITabBarController) {
            let tabBarController = (rootViewController as! UITabBarController)
            return self.topViewController(withRootViewController: tabBarController.selectedViewController!)
        }
        else if (rootViewController is UINavigationController) {
            let navigationController = (rootViewController as! UINavigationController)
            return self.topViewController(withRootViewController: navigationController.visibleViewController!)
        }
        else if (rootViewController.presentedViewController != nil) {
            let presentedViewController = rootViewController.presentedViewController
            return self.topViewController(withRootViewController: presentedViewController!)
        }
        else {
            return rootViewController
        }
    }
    
   
    
    /// Mail composer did finish the work
    ///
    /// - Parameters:
    ///   - controller: Mail Controller object
    ///   - result: Mail result
    ///   - error: Error
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // This function add google analytics
     /// Add Google Analytics
     ///
     /// - Parameters:
     ///   - analyticsParameterItemID: analyticsParameterItemID
     ///   - analyticsParameterItemName: analyticsParameterItemName
     ///   - analyticsParameterContentType: analyticsParameterContentType
    
    
    
    /// Show message below navigationbar[
    ///
    /// - Parameters:
    ///   - message: Message to be displayed
    ///   - type: Type of Message
    func showTopMessage(message : String?, type : NotificationType, displayDuration: Double = 2, apiFailure: Bool? = false, fromVC: String? = "") {
        if(type == .Error) {
            #if canImport(TALogger)
            let aStrType = type.rawValue == "Error" ? "Debug" :  type.rawValue
            TALogger.shared.LogEvent(type: "Error", name: aStrType, description: message ?? "")
            #endif
        }
        
//        if let _ = message {
//            let view: MessageView = MessageView.viewFromNib(layout: .cardView)
//
//            var config = SwiftMessages.defaultConfig
//
//            view.configureTheme(type == .Success ? .success : .error )
//
//            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
//            config.duration = .seconds(seconds: displayDuration)
//            config.dimMode = .none
//
//            config.interactiveHide = true
//            view.iconImageView?.isHidden = true
//            view.iconLabel?.isHidden = true
//            view.button?.isHidden = true
//            view.button?.setTitle("Retry", for: .normal)
//            view.button?.addTarget(self, action: #selector(callRetryBtn), for: .touchUpInside)
//            view.titleLabel?.text = AppInfo.kAppName
//            view.bodyLabel?.text = message
//
//            view.configureDropShadow()
//
//            config.preferredStatusBarStyle = .lightContent
//
//            SwiftMessages.show(config: config, view: view)
//        }
    }
 
//    func showProgressMessage(message : String?, type : NotificationType, displayDuration: Double = 2) {
//
//        if let _ = message {
//            SwiftMessages.hideAll()
//            let view: MessageView = MessageView.viewFromNib(layout: .cardView)
//
//            var config = SwiftMessages.defaultConfig
//
//            view.configureTheme(.info)
//
//            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
//            config.duration = .forever
//            config.dimMode = .none
//
//            config.interactiveHide = false
//            view.iconImageView?.isHidden = true
//            view.iconLabel?.isHidden = true
//            view.button?.isHidden = true
//            view.titleLabel?.text = AppInfo.kAppName
//            view.bodyLabel?.text = message
//            view.configureDropShadow()
//
//            var activityView = UIActivityIndicatorView(style: .gray)
//            activityView.frame = CGRect(x: 320, y: 60, width: 50, height: 50)
//            activityView.startAnimating()
//            view.addSubview(activityView)
//
//            config.preferredStatusBarStyle = .lightContent
//
//            SwiftMessages.show(config: config, view: view)
//        }
//    }
    
    @objc func callRetryBtn(reviewId: String){
//        if fromVC == "getConfig"{
            NotificationCenter.default.post(name: Notification.Name("HomeIdentifier"), object: nil)
//        }
        
    }
    
    //after completion
    func showResultMessage(message : String?, type : NotificationType, reviewId: String, displayDuration: Double = 2) {
        
//        if let _ = message {
//            SwiftMessages.hideAll()
//            let view: MessageView = MessageView.viewFromNib(layout: .cardView)
//
//            var config = SwiftMessages.defaultConfig
//
//            view.configureTheme(type == .Success ? .success : .error )
//
//            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
//            if(type == .Success) {
//                config.duration = .seconds(seconds: displayDuration)
//            } else {
//                config.duration = .seconds(seconds: displayDuration)
//            }
//            config.dimMode = .none
//            print(reviewId)
//            config.interactiveHide = true
//            view.iconImageView?.isHidden = true
//            view.iconLabel?.isHidden = true
//            if(type == .Error) {
//                view.button?.isHidden = true
//                view.button?.setTitle("Retry", for: UIControl.State.normal)
//                view.button?.addTarget(self, action: #selector(self.retryTapped), for: .touchUpInside)
//            } else {
//                view.button?.isHidden = true
//            }
//            view.titleLabel?.text = AppInfo.kAppName
//            view.bodyLabel?.text = message
//
//            view.configureDropShadow()
//            config.preferredStatusBarStyle = .lightContent
//            SwiftMessages.show(config: config, view: view)
//        }
    }
    
    /// Formate Phone number while editing
    @objc func retryTapped(reviewId: String) {
        print("retryTapped")
//        SwiftMessages.hideAll()
//        MediaUploadManager.shared.retryImages(reviewId: reviewId)
    }
}


