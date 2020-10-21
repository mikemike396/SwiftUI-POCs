//
//  ViewController.swift
//  UISplitViewController_Testing
//
//  Created by Kushinski, Michael [COMRES/AC/SID] on 10/20/20.
//

import UIKit
import SwiftUI

enum DetailViewType  {
    case Connect
    case Customer
    case Configuration
    case Install
}

final class MasterViewController: UIViewController {
    var detailViewType: DetailViewType = .Connect

    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        var view = SwiftUI_MasterView()
         view.presentingVC = self
        return UIHostingController(coder: coder, rootView: view)
    }
    
    func swiftUIToUIKitSegue()
    {
        self.performSegue(withIdentifier: "showDetailFromSwiftUI", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController,
            let viewController = navController.topViewController as? DetailViewController
        else {
            return
        }
        viewController.detailViewType = detailViewType
    }
}

extension MasterViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Returning true prevents the default of showing
        // the secondary view controller.
        guard let navigationController = secondaryViewController as? UINavigationController,
            let detailViewController = navigationController.topViewController as? DetailViewController else {
            // Fallback to the default
            return false
        }

        // Once we have something to show in the detail
        // view return false to show the secondary in a
        // collapsed split view
        return true
    }
}
