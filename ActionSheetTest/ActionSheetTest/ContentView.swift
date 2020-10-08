//
//  ContentView.swift
//  ActionSheetTest
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 10/8/20.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    @State var showActionSheet = false
    @State var showAddModal = false
    
    var body: some View {
        VStack {
            // ALERT
            Button(action: { self.showAlert = true }) {
                Text("Show Alert")
            }
            .alert(isPresented: $showAlert) {
                  Alert(title: Text("test"))
                 // showAlert set to false through the binding
            }

            // ACTION SHEET
            Button(action: { self.showActionSheet = true }) {
                Text("Show Action Sheet")
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Test"))
                 // showActionSheet set to false through the binding
            }

            // FULL-SCREEN VIEW
            Button(action: { self.showAddModal = true }) {
                Text("Show Modal")
            }
            .sheet(isPresented: $showAddModal, onDismiss: {} ) {
                // INSERT a call to the new view, and in it set showAddModal = false to close
                // e.g. AddItem(isPresented: self.$showAddModal)
            }
        }
    }
}
