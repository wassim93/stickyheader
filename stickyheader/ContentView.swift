//
//  ContentView.swift
//  stickyheader
//
//  Created by wassim on 7/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {

    var body: some View {
        VStack{
            Image("naruto")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2)
            VStack(alignment: .leading) {
                Text("Naruto")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding([.top,.bottom])

                Text(textDetail)
            }

            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
