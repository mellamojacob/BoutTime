//
//  AlbumView.swift
//  Bout Time
//
//  Created by Jacob Virgin on 8/4/16.
//  Copyright © 2016 Jacob Virgin. All rights reserved.
//

import Foundation
import UIKit

class AlbumView: UIViewController {

    var url: String = ""
    @IBOutlet weak var webView: UIWebView!
    
   
    
    override func viewDidLoad(){
        super.viewDidLoad()
        var index = 0
        for event in events {
            if event.selected {
                self.url = event.url
                events[index].selected = false
            }
            index+=1
        }
        createWebView()
    }
    
    func createWebView(){
        webView.loadRequest(NSURLRequest(URL: NSURL(string: self.url)!))
        
    }
    
    @IBAction func goBackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
