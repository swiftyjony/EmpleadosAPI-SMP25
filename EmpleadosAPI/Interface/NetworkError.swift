//
//  NetworkError.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 9/4/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case general(Error)
    case status(Int)
    case json(Error)
    case dataNotValid
    case nonHTTP

    var errorDescription: String? {
        switch self {
        case .general(let error):
            error.localizedDescription
        case .status(let code):
            "HTTP status code: \(code)"
        case .json(let error):
            "JSON error: \(error)"
        case .dataNotValid:
            "Data not valid"
        case .nonHTTP:
            "URLSession did not return an HTTPURLResponse"
        }
    }
}
