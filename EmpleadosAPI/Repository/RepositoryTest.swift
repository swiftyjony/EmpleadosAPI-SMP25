//
//  RepositoryTest.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

struct NetworkTest: DataRepository {
    let url = Bundle.main.url(forResource: "EmpleadosTesting", withExtension: "json")!

    func load<T>(url: URL, type: T.Type) throws -> T where T: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }

    func getEmpleados() async throws -> [Empleado] {
        try load(url: url, type: [EmpleadoDTO].self).map(\.toEmpleado)
    }

    func getEmpleado(id: Int) async throws -> Empleado? {
        .test
    }

    func updateEmpleado(_ empleado: Empleado) async throws {}
}


extension Empleado {
    static let test = Empleado(id: 1,
                               firstName: "Jon",
                               lastName: "Gonzalez",
                               username: "swiftyjony",
                               email: "swiftyjony@gmail.com",
                               address: "9608 Fieldstone Pass",
                               zipcode: "23456",
                               avatarURL: URL(string: "https://robohash.org/enimconsequaturveniam.png")!,
                               gender: Genero(rawValue: 1)!,
                               department: Departamento(rawValue: 1)!)
}
