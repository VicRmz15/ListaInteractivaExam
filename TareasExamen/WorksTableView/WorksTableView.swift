//
//  WorksTableView.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import UIKit

class WorksTableView: UIView {
    
    let dataBase = DataBase.shared
    var dataWorks = [Tarea]()
    
    var tableViewWorks : UITableView = {
        var table = UITableView()
        table.backgroundColor = .gray
        return table
    }()
    
    init(){
        super.init(frame: .zero)
        getWorks()
        initUI()
    }
    
    func initUI(){
        tableViewWorks.delegate = self
        tableViewWorks.dataSource = self
        
        
        self.addSubview(tableViewWorks)
        tableViewWorks.addAnchorsWithMargin(0)
    }
    
    func getWorks(){
        dataWorks = dataBase.getWorks()
        tableViewWorks.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WorksTableView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = WorksTableViewCell()
        
        let info = dataWorks[indexPath.row]
        print(info)
        cell.initUI(dataBase : info)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let botonDerecha1 = UITableViewRowAction(style: .normal, title: "Completar Tarea") { (action, indexPath) in
                  // Manejar la acción del botón derecho 1
                  print("Boton Derecha 1 presionado")
              }
              botonDerecha1.backgroundColor = UIColor.red

              let botonDerecha2 = UITableViewRowAction(style: .normal, title: "Eliminar Tarea") { (action, indexPath) in
                  // Manejar la acción del botón derecho 2
                  print("Boton Derecha 2 presionado")
              }
              botonDerecha2.backgroundColor = UIColor.green
        
        let botonIzquierda = UITableViewRowAction(style: .normal, title: "Editar Tarea") { (action, indexPath) in
        }
        botonIzquierda.backgroundColor = UIColor.yellow
        
        return [botonDerecha1, botonDerecha2, botonIzquierda]
        
        
        
    }
}
