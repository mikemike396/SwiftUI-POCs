//
//  ContentView.swift
//  PopoverBug
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 9/23/20.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked: Bool = false
    
    var body: some View{
        HStack{
            Button("Left Button", action:{print("Left Button Pressed")})
            Spacer()
            Button("Right Button",action:{self.isClicked = true})
                .popover(isPresented: self.$isClicked){Text("Popover")}
        }
    }
}
