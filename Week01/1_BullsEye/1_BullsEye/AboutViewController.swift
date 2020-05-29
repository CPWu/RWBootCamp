//
//  AboutViewController.swift
//  1_BullsEye
//
//  Created by Chun Wu on 2020-05-27.
//  Copyright © 2020 Chun Wu. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
          let url = URL(fileURLWithPath: htmlPath)
          let request = URLRequest(url: url)
          webView.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
