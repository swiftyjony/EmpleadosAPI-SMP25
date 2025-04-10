//
//  URL.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

#if DEBUG
let api = URL(string: "https://acacademy-employees-api.herokuapp.com/api")!
#else
let api = URL(string: "https://acacademy-employees-api.herokuapp.com/api")!
#endif


extension URL {
    static let getEmpleados = api.appending(path: "getEmpleados")
    static func getEmpleado(id: Int) -> URL {
        api.appending(path: "getEmpleado").appending(path: "\(id)")
    }
    static let empleado = api.appending(path: "empleado")
}
