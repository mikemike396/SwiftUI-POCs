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
        VStack{
            Button(action:{
                presentingVC?.detailViewType = .Connect
                presentingVC?.swiftUIToUIKitSegue()
            })
            {
                HStack{
                    VStack{
                        Text("STEP").font(.system(size: 9))
                        Image(systemName: "01.circle").font(.system(size: 20))
                    }
                    Spacer()
                    Text("Connect to CC200")
                    Spacer()
                }.padding()
            }
            Divider()
            Button(action:{
                presentingVC?.detailViewType = .Customer
                presentingVC?.swiftUIToUIKitSegue()
            })
            {
                HStack{
                    VStack{
                        Text("STEP").font(.system(size: 9))
                        Image(systemName: "02.circle").font(.system(size: 20))
                    }
                    Spacer()
                    Text("Select Customer")
                    Spacer()
                }.padding()
            }
            Divider()
            Button(action:{
                presentingVC?.detailViewType = .Configuration
                presentingVC?.swiftUIToUIKitSegue()
            })
            {
                HStack{
                    VStack{
                        Text("STEP").font(.system(size: 9))
                        Image(systemName: "03.circle").font(.system(size: 20))
                    }
                    Spacer()
                    Text("Select Configuration")
                    Spacer()
                }.padding()
            }
            Divider()
            Button(action:{
                presentingVC?.detailViewType = .Install
                presentingVC?.swiftUIToUIKitSegue()
            })
            {
                HStack{
                    VStack{
                        Text("STEP").font(.system(size: 9))
                        Image(systemName: "04.circle").font(.system(size: 20))
                    }
                    Spacer()
                    Text("Install")
                    Spacer()
                }.padding()
            }
            Divider()
            Spacer()
        }
    }
}

