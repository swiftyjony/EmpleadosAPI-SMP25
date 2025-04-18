//
//  EmpleadosVM.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import SwiftUI

@Observable @MainActor
final class EmpleadosVM {
    let repository: DataRepository

    var empleados: [Empleado] = []

    var showAlert = false
    var errorMsg = ""

    init(repository: DataRepository = Network()) {
        self.repository = repository
        Task {
            await self.getEmpleados()
        }
    }

    func getEmpleados() async {
        do {
            empleados = try await repository.getEmpleados()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }

    func getEmpleadosByDpto(_ dpto: Departamento) -> [Empleado] {
        empleados.filter { $0.department == dpto }
    }

    func update(empleado: Empleado) async {
        do {
            try await repository.updateEmpleado(empleado)
            if let index = empleados.firstIndex(where: { $0.id == empleado.id }) {
                if let employee = try await repository.getEmpleado(id: empleado.id) {
                    empleados[index] = employee
                }
            }
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
}
