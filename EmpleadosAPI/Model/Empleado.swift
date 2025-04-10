//
//  Empleado.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

struct Empleado: Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String?
    let avatarURL: URL?
    let gender: Genero
    let department: Departamento
}
