//
//  WorksTableViewCell.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import UIKit

class WorksTableViewCell: UITableViewCell {
    
    var dataBase : Tarea?
    
    var nameWork : UILabel = {
        var name = UILabel()
        return name
    }()
    
    var fechaRegistro : UILabel = {
        var fecha = UILabel()
        return fecha
    }()
    
    var fechaEntrega : UILabel = {
        var fecha = UILabel()
        return fecha
    }()
    
    var descripcionLabel : UILabel = {
        var label = UILabel()
        return label
    }()
    
    var descripcion : UITextView = {
        var descripcion = UITextView()
        return descripcion
    }()
    
    init(){
        super.init(style: .default, reuseIdentifier: nil)
        self.backgroundColor = .systemYellow
    }
    
    func initUI(dataBase: Tarea){
        self.dataBase = dataBase
        
        nameWork.text = "Nombre: \(dataBase.nombre ?? "")"
        nameWork.font = UIFont(name: "Arial Bold", size: 12)
        self.addSubview(nameWork)
        nameWork.addAnchorsAndSize(width: 120, height: 16, left: 5, top: 10, right: nil, bottom: nil)
        
        fechaRegistro.text = "Registro: \(dataBase.fechaDeregistro ?? "")"
        fechaRegistro.font = UIFont(name: "Arial Bold", size: 12)
        self.addSubview(fechaRegistro)
        fechaRegistro.addAnchorsAndSize(width: 120, height: 16, left: 5, top: 10, right: nil, bottom: nil, withAnchor: .top,relativeToView: nameWork)
        
        fechaEntrega.text = "Entrega: \(dataBase.fechaDeEntrega ?? "")"
        fechaEntrega.font = UIFont(name: "Arial Bold", size: 12)
        self.addSubview(fechaEntrega)
        fechaEntrega.addAnchorsAndSize(width: 120, height: 16, left: 5, top: 10, right: nil, bottom: nil, withAnchor: .top,relativeToView: fechaRegistro)
        
        descripcionLabel.text = "Descripcion de la tarea: "
        descripcionLabel.font = UIFont(name: "Arial Bold", size: 12)
        self.addSubview(descripcionLabel)
        descripcionLabel.addAnchorsAndSize(width: 150, height: 12, left: 10, top: 10, right: nil, bottom: nil, withAnchor: .left, relativeToView: nameWork)
        
        descripcion.text = dataBase.descripcion
        descripcion.font = UIFont(name: "Arial", size: 10)
        descripcion.textColor = .white
        descripcion.backgroundColor = .lightGray
        self.addSubview(descripcion)
        descripcion.addAnchorsAndSize(width: 220, height: 60, left: 10, top: 25, right: nil, bottom: nil, withAnchor: .left,relativeToView: fechaRegistro)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
