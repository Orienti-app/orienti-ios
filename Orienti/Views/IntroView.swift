//
//  IntroView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 25/09/2021.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Spacer()
            Group {
                Button {
                    print("runner tapped")
                } label: {
                    Text("I am runner")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 50)
                        .background(Appearance.Colors.primary)
                        .cornerRadius(5)
                }.padding()
                
                Button {
                    print("trainer tapped")
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
