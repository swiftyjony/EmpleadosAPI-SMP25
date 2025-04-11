//
//  EmpleadoAvatar.swift
//  EmpleadosAPI
//
//  Created by Jon Gonzalez on 10/4/25.
//

import SwiftUI

struct EmpleadoAvatarOld: View {
    var avatarURL: URL?
    var body: some View {
        AsyncImage(url: avatarURL) { image in
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

#Preview {
    EmpleadoAvatarOld(avatarURL: Empleado.test.avatarURL)
}
