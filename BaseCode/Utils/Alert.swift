//
//  Alert.swift
//  BaseCode
//

import UIKit

class Alert {
  static var shared: Alert = {
    let instance = Alert()
    return instance
  }()
  
  func showAlert(error: String) {
    let alertController = UIAlertController(title: "Ooops...", message: error, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
    alertController.addAction(okAction)
    
    var rootViewController = UIApplication.shared.keyWindow?.rootViewController
    if let navigationController = rootViewController as? UINavigationController {
      rootViewController = navigationController.viewControllers.first
    }
    if let tabBarController = rootViewController as? UITabBarController {
      rootViewController = tabBarController.selectedViewController
    }
    
    rootViewController?.present(alertController, animated: true, completion: nil)
  }
}
