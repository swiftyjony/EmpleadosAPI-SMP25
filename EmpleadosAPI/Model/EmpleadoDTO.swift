//
//  EmpleadoDTO.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

struct EmpleadoDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String
    let avatar: String?
    let gender: GeneroDTO
    let department: DepartamentoDTO

    var toEmpleado: Empleado {
        Empleado(
            id: id,
            firstName: firstName,
            lastName: lastName,
            username: username,
            email: email,
            address: address,
            zipcode: zipcode.isEmpty ? nil : zipcode,
            avatarURL: (avatar?.isEmpty == false ? URL(string: avatar!) : nil),
            gender: Genero(rawValue: gender.id) ?? .desconocido,
            department: Departamento(rawValue: department.id) ?? .desconocido
        )
    }
}

struct DepartamentoDTO: Codable {
    let id: Int
    let name: String
}

struct GeneroDTO: Codable {
    let id: Int
    let gender: String
}
