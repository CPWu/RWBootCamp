//
//  AboutRGBViewController.swift
//  2_ColorPicker
//
//  Created by Chun Wu on 2020-06-01.
//  Copyright © 2020 Chun Wu. All rights reserved.
//

import UIKit
import WebKit

class AboutRGBViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myUrl = URL(string: "https://en.wikipedia.org/wiki/RGB_color_model")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
