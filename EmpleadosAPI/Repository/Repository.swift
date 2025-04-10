//
//  Repository.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

protocol DataRepository: Sendable, NetworkInteractor {
    func getEmpleados() async throws -> [Empleado]
    func getEmpleado(id: Int) async throws -> Empleado?
    func updateEmpleado(_ empleado: Empleado) async throws
}

struct Network: DataRepository {
    func getEmpleados() async throws -> [Empleado] {
        try await getJSON(.get(url: .getEmpleados), type: [EmpleadoDTO].self).map(\.toEmpleado)
    }

    func getEmpleado(id: Int) async throws -> Empleado? {
        try await getJSON(.get(url: .getEmpleado(id: id)), type: EmpleadoDTO.self).toEmpleado
    }

    func updateEmpleado(_ empleado: Empleado) async throws {
        try await getStatus(request: .post(url: .empleado, body: empleado.toUpdate, method: .put))
    }
}
