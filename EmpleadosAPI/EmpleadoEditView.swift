//
//  EmpleadoEditView.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 10/4/25.
//

import CompoKit
import SwiftUI

struct EmpleadoEditView: View {
    @State var vm: EmpleadoEditVM
    @Bindable var empleadosVM: EmpleadosVM
    @FocusState var field: FormFields?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section {
                CoolTextField(titleLabel: "First Name",
                              placeholder: "Enter the first name of the employee",
                              value: $vm.firstName,
                              validation: .isNotEmpty,
                              focus: field == .firstName)
                .focused($field, equals: .firstName)
                .textContentType(.name)
                .textInputAutocapitalization(.words)
                CoolTextField(titleLabel: "Last Name",
                              placeholder: "Enter the last name of the employee",
                              value: $vm.lastName,
                              validation: .isNotEmpty,
                              focus: field == .lastName)
                .focused($field, equals: .lastName)
                .textContentType(.familyName)
                .textInputAutocapitalization(.words)
                Picker(selection: $vm.gender) {
                    ForEach(Genero.allCases) { gender in
                        Text(gender.descripcion)
                    }
                } label: {
                    Text("Gender")
                }
                .pickerStyle(.menu)
                CoolTextField(titleLabel: "Address",
                              placeholder: "Enter the address of the employee",
                              value: $vm.address,
                              validation: .isNotEmpty,
                              focus: field == .address)
                .focused($field, equals: .address)
                .textContentType(.fullStreetAddress)
                .textInputAutocapitalization(.words)
                CoolTextField(titleLabel: "ZIP Code",
                              placeholder: "Enter the zip code of the employee",
                              value: $vm.zipcode,
                              validation: .isNotEmpty,
                              focus: field == .zipcode)
                .focused($field, equals: .zipcode)
                .textContentType(.postalCode)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            } header: {
                Text("Employee data")
                    .font(.headline)
            }
            Section {
                CoolTextField(titleLabel: "Email",
                              placeholder: "Enter the email of the employee",
                              value: $vm.email,
                              validation: .isEmail,
                              focus: field == .email)
                .focused($field, equals: .email)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                CoolTextField(titleLabel: "User Name",
                              placeholder: "Enter the username of the employee",
                              value: $vm.username,
                              validation: .isValidUsername,
                              focus: field == .username)
                .focused($field, equals: .username)
                .textContentType(.username)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                Picker(selection: $vm.department) {
                    ForEach(Departamento.allCases) { dpto in
                        Text(dpto.descripcion)
                    }
                } label: {
                    Text("Department")
                }
                .pickerStyle(.menu)
            } header: {
                Text("Professional data")
                    .font(.headline)
            }
        }
        .navigationTitle("Edit employee")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    Task {
                        await empleadosVM.update(empleado: vm.updatedEmployee())
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }

            }
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Button {
                        field?.previous()
                    } label: {
                        Image(systemName: "chevron.up")
                    }
                    Button {
                        field?.next()
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    Spacer()
                    Button {
                        field = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmpleadoEditView(vm: EmpleadoEditVM(empleado: .test),
                         empleadosVM: EmpleadosVM(repository: NetworkTest()))
    }
}
