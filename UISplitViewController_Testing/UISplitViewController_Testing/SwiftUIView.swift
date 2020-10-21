//
//  SwiftUIView.swift
//  UISplitViewController_Testing
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 10/20/20.
//

import SwiftUI
import UIKit

struct SwiftUI_MasterView : View {
    var presentingVC: MasterViewController?
    
    var body: some View {
//        NavigationView{
            Button("SwiftUI Button", action: {
                print(presentingVC?.classForCoder)
                presentingVC?.swiftUIToUIKitSegue()
            })
//       }
    }
}

