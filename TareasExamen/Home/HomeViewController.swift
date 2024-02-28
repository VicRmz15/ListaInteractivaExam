//
//  HomeViewController.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel : HomeViewModel!
    
    var worksLabel: UILabel = {
        var label = UILabel()
        label.text = "Works"
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold Italic", size: 30)
        return label
    }()
    
    var buttonNewWork: UIButton = {
        var button = UIButton()
        button.setTitle("+ Nueva Tarea", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    var tableWorks: WorksTableView = {
       var table = WorksTableView()
        table.backgroundColor = .blue
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        initUI()
    }
    
    func initUI (){
        
        view.addSubview(worksLabel)
        worksLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 100, height: 30, left: nil, top: 60, right: nil, bottom: nil)
        
        buttonNewWork.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        view.addSubview(buttonNewWork)
        buttonNewWork.addAnchorsAndSize(width: 130, height: 30, left: 30, top: 30, right: nil, bottom: nil, withAnchor: .top, relativeToView: worksLabel)
        
        view.addSubview(tableWorks)
        tableWorks.addAnchorsAndCenter(centerX: true, centerY: nil, width: width-10, height: 600, left: nil, top: 30, right: nil, bottom: nil, withAnchor: .top,relativeToView: buttonNewWork)
    }
    
    @objc func registerAction(){
      viewModel.goToRegister()
    }


}
