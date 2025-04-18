//
//  EmpleadoEditVM.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 10/4/25.
//

import SwiftUI

enum FormFields {
    case firstName, lastName, address, zipcode, email, username

    mutating func next() {
        switch self {
        case .firstName: self = .lastName
        case .lastName: self = .address
        case .address: self = .zipcode
        case .zipcode: self = .email
        case .email: self = .username
        case .username: self = .firstName
        }
    }

    mutating func previous() {
        switch self {
        case .firstName: self = .username
        case .lastName: self = .firstName
        case .address: self = .lastName
        case .zipcode: self = .address
        case .email: self = .zipcode
        case .username: self = .email
        }
    }
}

@Observable
final class EmpleadoEditVM {
    let empleado: Empleado

    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var address: String
    var zipcode: String
    var avatarURL: URL?
    var gender: Genero
    var department: Departamento

    init(empleado: Empleado) {
        self.empleado = empleado
        self.firstName = empleado.firstName
        self.lastName = empleado.lastName
        self.username = empleado.username
        self.email = empleado.email
        self.address = empleado.address
        self.zipcode = empleado.zipcode ?? ""
        self.avatarURL = empleado.avatarURL
        self.gender = empleado.gender
        self.department = empleado.department
    }

    func updatedEmployee() -> Empleado {
        Empleado(id: empleado.id,
                 firstName: firstName,
                 lastName: lastName,
                 username: username,
                 email: email,
                 address: address,
                 zipcode: zipcode,
                 avatarURL: empleado.avatarURL,
                 gender: gender,
                 department: department)
    }
}
