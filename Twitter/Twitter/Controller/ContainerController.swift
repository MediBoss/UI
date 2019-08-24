//
//  ContainerController.swift
//  Twitter
//
//  Created by Medi Assumani on 8/23/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit


class ContainerController: UIViewController{
    
    // MARK: PROPERTIES
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpended = false
    
    
    // MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: HANDLERS
    private func configureHomeController(){
        
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func configureMenuController(){
        
        if menuController == nil {
            
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    private func showMenuController(shouldExpend: Bool){
        
        if shouldExpend {
            // show menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                // animate
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                
            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                // animate
                self.centerController.view.frame.origin.x = 0
                
            }, completion: nil)
        }
    }
    
}

extension ContainerController: HomeControllerDelegate {
    
    func handleMenuToggle() {
        
        if !isExpended{
            configureMenuController()
        }
        
        isExpended =  !isExpended
        showMenuController(shouldExpend: isExpended)
    }
}
