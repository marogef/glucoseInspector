//
//  yellowViewController.swift
//  Project_3
//
//  Created by . on 3/11/16.
//  Copyright (c) 2016 Faras. All rights reserved.
//

import UIKit

class yellowViewController: UIViewController

{
    //@IBOutlet weak var mySwitch: UISwitch!
   // @IBOutlet weak var webView: UIWebView!
   // @IBOutlet weak var back: UIButton!
   // @IBOutlet weak var forward: UIButton!
   // @IBOutlet weak var textBox3: UITextField!
    
    

    //create outlets
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var forward: UIButton!
    
    @IBOutlet weak var textBox3: UITextField!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var fit: UILabel!
    
    
    
    //add the appropriate site
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let home = NSURL(string: "http://diabetes.org")
        let requests = NSURLRequest(URL: home!)
        webView.loadRequest(requests)

    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //create function when getting done with keyboard
    @IBAction func doneWithKeyboard(sender: AnyObject)
    {
        sender.resignFirstResponder
        var url: NSURL
        
        let prefix = "htp://"
        var index1 = advance(textBox3.text.startIndex, 7)
     
        if (textBox3.text == prefix){
            
        }
        if (textBox3.text.substringToIndex(index1) == prefix){
            url = NSURL (string: textBox3.text)!
        }
        else
        {
            url = NSURL(string: "http://" + textBox3.text)!
        }
        
        var request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
     }

    //function for the go back button
    @IBAction func goBack(sender: AnyObject)
    {
        webView.goBack()
    }
   //function for the go forward
    
    @IBAction func goForward(sender: AnyObject)
    {
        webView.goForward()
    }
    
    @IBAction func changeFit(sender: AnyObject){
        if (mySwitch.on)
        {
            webView.scalesPageToFit = true;
        }
        else
        {
            webView.scalesPageToFit = false;
        }
        webView.reload()
    }

    
}
