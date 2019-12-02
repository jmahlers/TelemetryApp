//
//  LivestreamView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/4/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import WebKit

class LivestreamView: UIViewController, TelemetryDelegate, UIScrollViewDelegate, WKNavigationDelegate{
    
    @IBOutlet weak var livestream: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        Telemetry.shared.delegate = self
        livestream.scrollView.isScrollEnabled=false
        livestream.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showSpinner(onView: self.livestream)
        let iframe = "<iframe src=\"https://player.twitch.tv/?channel=washuracing\" frameborder=\"0\" allowfullscreen=\"true\" scrolling=\"no\" height=\"100%\" width=\"100%\"></iframe>"
        self.livestream.loadHTMLString(iframe, baseURL: nil)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.removeSpinner()
    }
    func manageMessage(key: String, dataPoint: DataPoint) {
    }
    func manageOpen() {
    }
    func manageComplete() {
    }
    func newSensor(sensor: Sensor) {
    }
}
