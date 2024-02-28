//
//  RegisterCoordinator.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import Foundation
import UIKit

class RegisterCoordinator : Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = RegisterViewController()
        let viewModel = RegisterViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
    
    func goToHome(){
        let coordinatorLogin = HomeCoordinator(navigationController: navigationController)
        childCoordinator.append(coordinatorLogin)
        coordinatorLogin.startCoordinator()
    }
    
}
