//
//  lightRedViewController.swift
//  Project_3
//
//  Created by . on 3/11/16.
//  Copyright (c) 2016 Faras. All rights reserved.
//

import UIKit
import AVFoundation

//add the appropriate sound to the next section
class lightRedViewController: UIViewController
{
   
    let goodSoundURL = NSBundle.mainBundle().URLForResource("goodSound", withExtension: "mp3")
    var goodSoundPlayer = AVAudioPlayer()
    
 
    let badSoundURL = NSBundle.mainBundle().URLForResource("badSound", withExtension: "mp3")
    var badSoundPlayer = AVAudioPlayer()
    
    let neutralOneSoundURL = NSBundle.mainBundle().URLForResource("neutralOne", withExtension: "mp3")
    var neutralOnePlayer = AVAudioPlayer()
    var carbFoods: [String] = ["Bannana", "Apples", "Pears", "Eggplants", "Bread", "Grapes", "Squash", "Cherries", "Appricots"]
 
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
           let notificationCenter = NSNotificationCenter.defaultCenter()
        
        
        notificationCenter.addObserver(
            self,
            selector:"keyboardWillBeHidden:", name:UIKeyboardWillHideNotification, object: nil)
        
        
        
        
        goodSoundPlayer = AVAudioPlayer(contentsOfURL: goodSoundURL, error: nil)
        badSoundPlayer = AVAudioPlayer(contentsOfURL: badSoundURL, error: nil)
        neutralOnePlayer = AVAudioPlayer(contentsOfURL: neutralOneSoundURL, error: nil)
       // proteinTable.frame = CGRectMake(0, 50, 320, 200)
        
        carbTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(carbTable)

        
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    //declare outlets
    
    @IBOutlet weak var activeField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var valueTwo: UILabel!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var message: UILabel!

    @IBOutlet weak var carbTable: UITableView!
 
    @IBOutlet weak var titleMessage: UILabel!
    
    @IBAction func showText(sender: AnyObject)
    {
        
        sender.resignFirstResponder()
    }
    //create code for background tap
    
    @IBAction func backgroundTap(sender: AnyObject){
        textBox2.resignFirstResponder()
        
    }
    //create code when getting done with keyboard
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
    
    
    
//create function for when the keyboard will hide
    
    
    func keyboardWillBeHidden(aNotification: NSNotification)
    {
        let contentInsets = UIEdgeInsetsZero;
        scrollView.contentInset = contentInsets;
        scrollView.scrollIndicatorInsets = contentInsets;
    }
    
    
    
    //create main button function
    @IBAction func buttonPressed(sender: AnyObject)
    {
        
        let userInput = textBox2.text.toInt()
        
        
        if (userInput >= 60 && userInput <= 99 )
        {
            textLabel.text = "You are in the normal range."
            goodSoundPlayer.play()
        }
        else if (userInput >= 100 && userInput <= 125)
        {
           textLabel.text = "You are in the Pre-diabetic stage."
           neutralOnePlayer.play()
            
        }
        else if( userInput >= 126)
        {
           textLabel.text = "You are diabetic."
           badSoundPlayer.play()
        }
        
    }
    

    //add code for the table
     func numberOfSectionsInTableView(tableView: UITableView?) -> Int
     {
        return 1
    }
    

    func tableView(proteinTable: UITableView?, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return self.carbFoods.count
        
    }
    
    
    
    func tableView(proteinTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell:UITableViewCell = proteinTable.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        let image : UIImage = UIImage(named:"carb.png")!
        cell.imageView!.image = image
        cell.textLabel?.text = self.carbFoods[indexPath.row]
        return cell
        
    }
}