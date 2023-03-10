//
//  InformationView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 16/09/20.
//

import SwiftUI

struct InformationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading, spacing: 30) {
                    Text("Everything in this world can become better. We are still far from achieving perfection.")
                        .fontWeight(.thin)
                        .foregroundColor(.gray)
                        .padding(.top, 50)
                        .padding(.bottom, 70)
                    Text("Follow us on:")
                    
                    HStack {
                        Image("instagram")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.leading, -4)
                        Text("atlantiselements")
                            .padding(.leading, -5)
                    }
                    HStack {
                        Image("twitter")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("atlantiselement")
                    }
                }
                Spacer()
                Text("Made by Atlantis Elements")
                    .fontWeight(.thin)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
            }.padding([.leading, .trailing], 20)
            
                .navigationTitle("About us")
                .navigationBarItems(trailing:
                    Button("Dismiss") {
                        presentationMode.wrappedValue.dismiss()
                    }
                )
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
