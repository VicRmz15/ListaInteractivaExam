//
//  HomeCoordinator.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import Foundation
import UIKit

class HomeCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
      self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = HomeViewController()
    let viewModel = HomeViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
    
    func goToRegister(){
      let coordinatorRegister = RegisterCoordinator(navigationController: navigationController)
      childCoordinator.append(coordinatorRegister)
      coordinatorRegister.startCoordinator()
      
    }
  
}
