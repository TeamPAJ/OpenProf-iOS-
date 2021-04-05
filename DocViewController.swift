//
//  DocViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 05/04/2021.
//

import UIKit
import WebKit

class DocViewController: UIViewController, WKNavigationDelegate {
    //@IBOutlet weak var docButton : UIButton!
    public var webView: WKWebView!
    
    // Base
    override func loadView() {
        self.webView = WKWebView()
        self.webView.navigationDelegate = self
        view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://github.com/TeamPAJ/OpenProf-iOS-")!
        self.webView.load(URLRequest(url: url))
        //self.webView.allowsBackForwardNavigationGestures = true
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = self.webView.title
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
