//
//  Enums.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

enum Departamento: Int, Codable, CaseIterable, Identifiable {
    case accounting = 1
    case businessDevelopment = 2
    case engineering = 3
    case humanResources = 4
    case legal = 5
    case marketing = 6
    case productManagement = 7
    case researchAndDevelopment = 8
    case sales = 9
    case services = 10
    case support = 11
    case training = 12
    case desconocido = -1

    var descripcion: String {
        switch self {
        case .accounting: return "Accounting"
        case .businessDevelopment: return "Business Development"
        case .engineering: return "Engineering"
        case .humanResources: return "Human Resources"
        case .legal: return "Legal"
        case .marketing: return "Marketing"
        case .productManagement: return "Product Management"
        case .researchAndDevelopment: return "Research and Development"
        case .sales: return "Sales"
        case .services: return "Services"
        case .support: return "Support"
        case .training: return "Training"
        case .desconocido: return "Desconocido"
        }
    }

    var id: Self { self }
}

enum Genero: Int, Codable, CaseIterable, Identifiable {
    case male = 1
    case female = 2
    case desconocido = -1

    var descripcion: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        case .desconocido: return "Desconocido"
        }
    }

    var id: Self { self }
}
