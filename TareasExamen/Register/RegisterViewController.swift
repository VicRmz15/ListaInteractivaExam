//
//  RegisterViewController.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var viewModel : RegisterViewModel!
    let dataBase = DataBase.shared
    
    var newWorksLabel: UILabel = {
        var label = UILabel()
        label.text = "Registro de Tarea"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold Italic", size: 28)
        return label
    }()
    
    var name : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Nombre de tu Tarea"
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    var fechaRegistro : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Fecha de Registro (formato: dd/mm/aaaa)"
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    var fechaDeEntrega : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Fecha de Entrega (formato: dd/mm/aaaa)"
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    var descripcionLabel: UILabel = {
        var label = UILabel()
        label.text = "Escribe la descripción detallada de tu tarea en el siguiente recuadro: "
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Arial Bold", size: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    var descripcion : UITextView = {
        var textField = UITextView()
        textField.textAlignment = .left
        textField.isScrollEnabled = true
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    var createWorkButton : UIButton = {
        var workBtn = UIButton()
        workBtn.setTitle("Guardar", for: .normal)
        workBtn.setTitleColor(.white, for: .normal)
        workBtn.backgroundColor = .lightGray
        workBtn.layer.cornerRadius = 25
        return workBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.navigationBar.isHidden = true
    }
    
    func initUI(){
        
        view.addSubview(newWorksLabel)
        newWorksLabel.addAnchorsAndCenter(centerX: true, centerY: false, width: 300, height: 30, left: nil, top: 100, right: nil, bottom: nil)
        
        view.addSubview(name)
        name.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top,relativeToView: newWorksLabel)
          
          view.addSubview(fechaRegistro)
        fechaRegistro.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: name)
        
        view.addSubview(fechaDeEntrega)
        fechaDeEntrega.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top,relativeToView: fechaRegistro)
          
        view.addSubview(descripcionLabel)
        descripcionLabel.addAnchorsAndSize(width: width-10, height: 50, left: 10, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: fechaDeEntrega)
        
          view.addSubview(descripcion)
        descripcion.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 150, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: descripcionLabel)
        
        createWorkButton.addTarget(self, action: #selector(textFieldValidation), for: .touchUpInside)
        view.addSubview(createWorkButton)
        createWorkButton.addAnchorsAndCenter(centerX: true, centerY: false, width: width - 10, height: 50, left: nil, top: 10, right: nil, bottom: nil,withAnchor: .top, relativeToView: descripcion)
        
    }
    
    @objc func textFieldValidation(){
        let names = name.text
        let fechaDeRegistro1 = fechaRegistro.text
        let fechaDeEntrega1 = fechaDeEntrega.text
        let descripcion1 = descripcion.text
        
        if (names?.isEmpty ?? true) || (fechaDeRegistro1?.isEmpty ?? true) || (fechaDeEntrega1?.isEmpty ?? true) || (descripcion1?.isEmpty ?? true){
            
        let alert = UIAlertController(title: "Alguno de tus campos está vacío", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        }else{
          
        let tarea = Tarea(nombre: names, fechaDeEntrega: fechaDeEntrega1, fechaDeregistro: fechaDeRegistro1, descripcion: descripcion1, isPending: true)
          
          dataBase.registerTarea(tarea: tarea)
          
          viewModel.goToHome()
        }
      }
}
