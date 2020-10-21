//
//  SwiftUIView.swift
//  UISplitViewController_Testing
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 10/20/20.
//

import SwiftUI
import UIKit

struct SwiftUI_DetailView : View {
    var presentingVC: DetailViewController?
    
    var body: some View {
        if self.presentingVC?.detailViewType == .Connect
        {
            connectView()
        }
        else if self.presentingVC?.detailViewType == .Customer
        {
            customerView()
        }
        else if self.presentingVC?.detailViewType == .Configuration
        {
            configView()
        }
        else if self.presentingVC?.detailViewType == .Install
        {
            installView()
        }
    }
}

struct connectView: View {
    var body: some View {
        VStack{
            Text("Select CC200")
            Text("CC200_A99a")
            Text("CC200_A99b")
            Spacer()
        }
        .onAppear{
            print("Configure View")
        }
    }
}

struct customerView: View {
    var body: some View {
        VStack{
            Text("Select Customer")
            List{
                Text("ALDI")
                Text("Piggly Wiggly")
            }
            Spacer()
        }
        .onAppear{
            print("Configure View")
        }
    }
}

struct configView: View {
    var body: some View {
        VStack{
            Text("Select Config")
            List{
                Text("AX6LN")
                Text("BX6LN")
            }
            Spacer()
        }
        .onAppear{
            print("Configure View")
        }
    }
}

struct installView: View {
    var body: some View {
        VStack{
            Text("Install Configuration")
            Text("Configuration")
            Text("Yea a config was picked")
            Text("Install")
                .bold()
                .padding()
                .foregroundColor(Color.white)
                .background(Rectangle().fill(Color.blue).cornerRadius(13))
            Spacer()
        }
        .onAppear{
            print("Configure View")
        }
    }
}
