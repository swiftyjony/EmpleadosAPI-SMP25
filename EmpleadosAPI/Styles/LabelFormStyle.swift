//
//  LabelFormStyle.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 11/4/25.
//

import SwiftUI

struct LabelFormStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            Spacer()
            configuration.icon
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background {
            Color.secondary.opacity(0.1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension LabelStyle where Self == LabelFormStyle {
    static var formLabelStyle: LabelFormStyle {
        LabelFormStyle()
    }
}
