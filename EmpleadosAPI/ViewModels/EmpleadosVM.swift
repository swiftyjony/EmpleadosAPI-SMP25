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
}
