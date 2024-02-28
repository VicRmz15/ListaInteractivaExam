//
//  AppCoordinator.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import Foundation
import UIKit


protocol Coordinator{
  var childCoordinator : [Coordinator] {get set}//get obtener su valor, set asignarle un valor
  func startCoordinator()
}

class AppCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var window : UIWindow
  
  init(window : UIWindow){
    self.window = window
  }
  
  
  func startCoordinator() {
    let navigationController = UINavigationController()
    let homeCoordinator = HomeCoordinator(navigationController : navigationController )
    childCoordinator.append(homeCoordinator)
    homeCoordinator.startCoordinator()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  
}
