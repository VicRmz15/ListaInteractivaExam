//
//  DataBase.swift
//  TareasExamen
//
//  Created by Vìctor Rmz on 27/02/24.
//

import Foundation

class DataBase{
  static let shared = DataBase()
  let tareaDefaults = UserDefaults.standard
  
  func getWorks() -> [Tarea]{
      if let tareas = tareaDefaults.getData(type: [Tarea].self, key: TareaDefaultsKeys.tareas.rawValue){
      return tareas
    }
    return []
  }
  
  func registerTarea(tarea : Tarea){
    var tareas = getWorks()
    tareas.append(tarea)
    tareaDefaults.putData(object: tareas, key: TareaDefaultsKeys.tareas.rawValue)
    print(tareas)
  }
  
}

extension UserDefaults {
  func putData<T:Encodable>(object : T, key : String){
    let jsonEncoder = JSONEncoder()
    if let userEncode = try? jsonEncoder.encode(object){
      self.set(userEncode, forKey: key)
    }
  }
  
  func getData<T : Decodable>(type : T.Type, key : String) -> T?{
    if let data = self.data(forKey: key){
      let jsonDecoder = JSONDecoder()
      if let tarea = try? jsonDecoder.decode(type, from: data){
        return tarea
      }else{
        print("Error decoding data")
        return nil
      }
    }else{
      print("Error getting data")
      return nil
    }
  }
  
  func deleteData(key : String){
    self.removeObject(forKey: key)
    print("Delete data: \(key)")
  }
}
