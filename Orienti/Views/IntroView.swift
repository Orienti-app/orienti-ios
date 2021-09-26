//
//  IntroView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 25/09/2021.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("orienti-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 256.0, height: 256.0)
                Spacer()
                NavigationLink {
                    RegisterUserView(choice: .runner)
                } label: {
                    Text("I am runner")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 50)
                        .background(Appearance.Colors.primary)
                        .cornerRadius(5)
                }.padding()
                NavigationLink {
                    RegisterUserView(choice: .trainer)
                } label: {
                    Text("I am trainer")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 50)
                        .background(Appearance.Colors.secondary)
                        .cornerRadius(5)
                }.padding(.bottom, 30)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
