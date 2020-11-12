//
//  SwiftUIView.swift
//  w2mClient
//
//  Created by Welday, James E [COMRES/REF/SID] on 11/11/20.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var masterArray = ["One", "Two", "Three"]
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var present: Bool = false
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Button(action: {present.toggle()})
                {
                    Text("Press Me!")
                }
                ForEach(viewModel.masterArray, id: \.self){text in
                    Text(text)
                }
            }
        }
        .overlay(
            ZStack{
                if self.present
                {
                    Color.black.opacity(0.3)
                        .onTapGesture{
                            present.toggle()
                        }
                        .edgesIgnoringSafeArea(.all)
                    
                    compareView(array: viewModel.masterArray, oldArray: $viewModel.masterArray)
                }
            }
        )
    }
}

struct compareView: View {
    @Binding var mainArray: [String]
    @State var tempArray: [String]
    
    init(array: [String], oldArray: Binding<[String]>)
    {
        _mainArray = oldArray // Passed by reference
        _tempArray = State(initialValue: array) // Passed by value!
    }
    
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Button(action: {mainArray = tempArray}, label: {
                    Text("Set Main to Temp")
                })
                HStack{
                    VStack{
                        Text("MainArray").padding()
                        Button(action: {mainArray.append("MasterAppended")})
                        {
                            Text("Append to Master")
                        }
                        ForEach(mainArray, id: \.self){text in
                            Text(text)
                        }
                        Spacer()
                    }
                    Divider()
                    VStack{
                        Text("TempArray").padding()
                        Button(action: {tempArray.append("TempAppended")})
                        {
                            Text("Append to Temp")
                        }
                        ForEach(tempArray, id: \.self){text in
                            Text(text)
                        }
                        Spacer()
                    }
                }
            }
        }.padding(40)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
