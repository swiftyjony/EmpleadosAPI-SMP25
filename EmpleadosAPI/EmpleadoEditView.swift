//
//  EmpleadoEditView.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 10/4/25.
//

import SwiftUI

struct EmpleadoEditView: View {
    @State var vm: EmpleadoEditVM
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EmpleadoEditView(vm: EmpleadoEditVM(empleado: .test))
}
