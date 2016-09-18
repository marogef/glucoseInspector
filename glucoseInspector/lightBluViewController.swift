//
//  ViewController.swift
//  Project_3
//
//  Created by . on 3/5/16.
//  Copyright (c) 2016 Faras. All rights reserved.
//

import UIKit
import EventKit


class lightBlueViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let notificationCenter = NSNotificationCenter.defaultCenter()
    
        
        notificationCenter.addObserver(
           self,
           selector:"keyboardWillBeHidden:", name:UIKeyboardWillHideNotification, object: nil)

    
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Create outlets.
 
    
 
    @IBOutlet weak var activeField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var carbView: UIImageView!
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textFields: UITextView!
    @IBOutlet weak var valueOne: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var handDown: UIImageView!
    @IBOutlet weak var handUp: UIImageView!
    
    
    
    
    //Add code for the keyboard to work properly.
    
   @IBAction func showText(sender: AnyObject)
    {
        
       sender.resignFirstResponder()
   }
    
    
    @IBAction func doneWithKeyboard(sender: AnyObject)
    {
        activeField = nil
        sender.resignFirstResponder()
    }
    
    
    @IBAction func didBeginEditing(sender: AnyObject)
    {
        activeField = sender as UITextField
    }
    
    
    
    @IBAction func didEndEditing(sender: AnyObject)
    {
        activeField=nil
    }
    

    
    
    func keyboardWillBeHidden(aNotification: NSNotification)
    {
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

 
    
    
    
    //function for background tap
    @IBAction func backgroundTap(sender: AnyObject){
        textBox1.resignFirstResponder()
        
    }
    
    //function for button pressed
    @IBAction func buttonPressed(sender: AnyObject)
    {
        let maximumCarbs = 60
        let minimumCarbs = 30
    //determine information from user input
        
    let userInput = textBox1.text.toInt()
     
        if (userInput > maximumCarbs)
        {
            textLabel.text = "Decrease your carbs"
            handUp.hidden = true
            handDown.hidden = false

        }
        else if (userInput < minimumCarbs)
        {
            textLabel.text = "Increase your carbs"
            handUp.hidden = true
            handDown.hidden = false
        }
        else
        {
            textLabel.text = "Carb intake is good"
            handUp.hidden = false
            handDown.hidden = true
        }
    }

    
}