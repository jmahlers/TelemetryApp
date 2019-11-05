//
//  LivestreamView.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 11/4/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import WebKit

class LivestreamView: UIViewController, TelemetryDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var livestream: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Telemetry.shared.delegate = self
        livestream.navigationDelegate = self
        //Using pokemon as placeholder for now
        let iframe = "<iframe src=\"https://player.twitch.tv/?channel=twitchplayspokemon\" frameborder=\"0\" allowfullscreen=\"true\" scrolling=\"no\" height=\"\(livestream.frame.height)\" width=\"\(livestream.frame.width)\" playsinline=\"1\"></iframe>"
        livestream.loadHTMLString(iframe, baseURL: nil)
    }
    
    
    func manageMessage(_ event: Sensor) {
    }
    func manageOpen() {
    }
    func manageComplete() {
    }
}
