//
//  ModelTareas.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 26/02/24.
//

import Foundation

struct Tarea : Codable{
    var nombre : String?
    var fechaDeEntrega : String?
    var fechaDeregistro : String?
    var descripcion : String?
    var isPending : Bool?
}


