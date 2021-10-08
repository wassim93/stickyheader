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
    // to track the header view
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()

    @State var show = false
    var body: some View {
        ScrollView {
            VStack{
                /* Stretchy header */
                GeometryReader { proxy in
                    Image("naruto")
                        .resizable()
                        // fixing the view to the top for the stretchy effect
                        .offset(y: proxy.frame(in: .global).minY > 0 ? -proxy.frame(in: .global).minY  : 0)
                        // increase header height by draging amount
                        .frame(height: proxy.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2 + proxy.frame(in: .global).minY : UIScreen.main.bounds.height / 2)
                        .onReceive(time, perform: { _ in
                            let y = proxy.frame(in: .global).minY
                            if -y > UIScreen.main.bounds.height / 2 - 50 {
                                show = true
                            }else{
                                show = false
                            }
                        })




                    // fixing default frame
                }.frame(height: UIScreen.main.bounds.height / 2)


                VStack(alignment: .leading) {
                    Text("Naruto")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()

                    Text(textDetail)
                        .padding([.leading,.trailing])
                }

                Spacer()
            }
        }.edgesIgnoringSafeArea(.top)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
