//
//  DetailViewController.swift
//  UISplitViewController_Testing
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 10/20/20.
//

import UIKit
import SwiftUI

final class DetailViewController: UIViewController {
    @IBOutlet private var detailLabel: UILabel!
    var detailViewType: DetailViewType = .Connect
    
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        var view = SwiftUI_DetailView()
        view.presentingVC = self
        return UIHostingController(coder: coder, rootView: view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}
