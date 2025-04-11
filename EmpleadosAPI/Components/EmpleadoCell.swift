//
//  EmpleadoCell.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 10/4/25.
//

import SwiftUI

struct EmpleadoCell: View {
    let empleado: Empleado
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("\(empleado.lastName), \(empleado.firstName)")
                    .font(.headline)
                Text(empleado.email)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                Text(empleado.username)
                    .font(.caption)
                    .italic()
            }
            Spacer()
            EmpleadoAvatar(avatarURL: empleado.avatarURL)
        }
    }
}

#Preview {
    EmpleadoCell(empleado: .test)
}
