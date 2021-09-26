//
//  RegisterUserView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 25/09/2021.
//

import SwiftUI

struct RegisterUserView: View {
    
    let choice: UserMode
    @State var name: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Your new name".uppercased())
                TextField("Set your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            NavigationLink {
                Text("Ahoj")
            } label: {
                Text("Confirm")
                    .foregroundColor(.black)
                    .frame(width: 250, height: 50)
                    .background(Appearance.Colors.primary)
                    .cornerRadius(5)
            }.padding()
        }
        .navigationTitle(choice.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegisterUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView(choice: .runner)
    }
}
