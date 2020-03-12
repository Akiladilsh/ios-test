//
//  Utill.swift
//  Todo
//
//  Created by Akila Dilshan on 3/11/20.
//  Copyright © 2020 Abhishek Prajapati. All rights reserved.
//

import UIKit

class Utill {
    
     static let shared = Utill()
    
    //Show Indicator
    
    func showIndicator(vc:UIViewController)  {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: .pleaseWait, preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    //Hide Indicator
    
    func hideIndicator(vc:UIViewController){
        DispatchQueue.main.async {
            vc.dismiss(animated: false, completion: nil)
        }
    }
    
    func showAlert(vc:UIViewController, title:String, message:String){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: .okHandler, style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
}


