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
        List(vm.empleados) { empleado in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(empleado.lastName), \(empleado.firstName)")
                        .font(.headline)
                    Text(empleado.email)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Spacer()
                AsyncImage(url: empleado.avatarURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 75)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }

            }
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
