//
//  ContentView.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var vm = EmpleadosVM()

    var body: some View {
        NavigationStack {
            List {
                ForEach(Departamento.allCases) { dpto in
                    Section {
                        ForEach(vm.getEmpleadosByDpto(dpto)) { empleado in
                            NavigationLink(value: empleado) {
                                EmpleadoCell(empleado: empleado)
                            }
                        }
                    } header: {
                        Text(dpto.descripcion)
                    }
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: Empleado.self) { empleado in
                EmpleadoEditView(vm: EmpleadoEditVM(empleado: empleado),
                                 empleadosVM: vm)
            }
        }
        .refreshable {
            await vm.getEmpleados()
        }
        .alert("Employee data error",
               isPresented: $vm.showAlert) {} message: {
            Text(vm.errorMsg)
        }
    }
}

#Preview {
    ContentView(vm: EmpleadosVM(repository: NetworkTest()))
}
