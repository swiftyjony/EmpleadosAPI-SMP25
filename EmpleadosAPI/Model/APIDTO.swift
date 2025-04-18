//
//  APIDTO.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

struct EmpleadoUpdate: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String?
    let avatarURL: String?
    let gender: String
    let department: String
}

extension Empleado {
    var toUpdate: EmpleadoUpdate {
        EmpleadoUpdate(id: id,
                       firstName: firstName,
                       lastName: lastName,
                       username: username,
                       email: email,
                       address: address,
                       zipcode: zipcode,
                       avatarURL: avatarURL?.absoluteString,
                       gender: gender.descripcion,
                       department: department.descripcion)
    }
}
