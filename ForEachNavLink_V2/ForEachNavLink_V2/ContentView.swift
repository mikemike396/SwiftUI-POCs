//
//  ContentView.swift
//  ForEachNavLink
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 9/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var versionsTest = ["1.00B03", "1.00B02", "1.00B01"]
    @State var present = false
    
    var body: some View {
        
        NavigationView
        {
            ZStack{
                VStack{
                    ForEach(versionsTest, id: \.self){ version in
                        Button(action: {
                            self.present = true
                        }, label: {
                            if version == self.versionsTest.first {
                                HStack{
                                    Text("Newest Firmware")
                                    Text(version)
                                    
                                }.padding(10)
                            }else{
                                Text(version)
                                    .padding(10)
                            }
                        })
                    }
                }
                NavigationLink(destination: addConfiguration(), isActive: self.$present){EmptyView()}
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

