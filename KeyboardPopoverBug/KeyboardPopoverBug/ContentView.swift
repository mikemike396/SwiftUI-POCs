//
//  ContentView.swift
//  ForEachNavLink
//
//  Created by Komrska, Jack [COMRES/AC/SID] on 10/16/20.
//
import SwiftUI

struct ContentView: View {
    @State var names = ["Jack", "Mike", "James", "Jackal", "Twisted Veins", "Mouse", "Crapple", "Microshaft", "Windblows", "Beatles", "Test"]
    var body: some View {
        List{
            ForEach(names, id: \.self){ name in
                reusable(name: .constant(name))
            }
        }
    }
    struct reusable: View {
        @Binding var name:String
        @State var isClicked = false
        @State var isEdit = false
        @State var tempName = ""
        var body: some View {
            Button(action: {
                self.isClicked = true
            }){
                HStack{
                    Spacer()
                    Text(name)
                    Spacer()
                }
                .onAppear{
                    self.tempName = name
                }
                .popover(isPresented: self.$isClicked){
                    Button(action: {
                        self.isEdit = true
                    }){
                        Text("Open sheet")
                    }
                    .sheet(isPresented: self.$isEdit){
                        VStack{
                            HStack{
                                Button(action: {
                                    self.isEdit = false
                                }){
                                    Text("Cancel")
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    self.isEdit = false

                                }){
                                    Text("'Save'")
                                }
                            }
                            TextField(tempName, text: $name)
                        }
                    }
                }
            }
        }
    }
}

