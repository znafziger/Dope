//
//  LiveBattleVC.swift
//  Dope
//
//  Created by Aaron Rosenberger on 4/21/16.
//  Copyright © 2016 Zach Nafziger. All rights reserved.
//

import UIKit
import R5Streaming

class LiveBattleVC: UIViewController {
    
    // MARK: - Properties & Outlets
    
    @IBOutlet weak var streamView: UIView!
    @IBOutlet weak var word:UIBarButtonItem!
    @IBOutlet weak var rhymingWord:UIBarButtonItem!
    @IBOutlet weak var handicapBar:UIToolbar!
    @IBOutlet weak var nextPair: UIBarButtonItem!
    
    var currentWord = 0
    var rhyme:Rhyme!
    var opponent:User!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RhymeService.populate(100)
        handicapBar.hidden = true
        word.title = "Word"
        nextPair.title = "Next Pair"
        rhymingWord.title = "Rhyming Word"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    // MARK: - Action Methods
    
    @IBAction func switchRapper(sender: UIBarButtonItem) {
        
    }
    
    func switchStreams() {
        let temp = Stream.getParameter("stream2") as! String
        Stream.setStream2Name(Stream.getParameter("stream1") as! String)
        Stream.setStream1Name(temp)
    }
    
    @IBAction func handicap(){
        if(handicapBar.hidden){
            switchWords()
            handicapBar.hidden = false
        } else{
            handicapBar.hidden = true
        }
        
    }
    
    @IBAction func switchWords(){
        rhyme = RhymeService.nextRhyme()
        word.title = rhyme.word
        rhymingWord.title = rhyme.rhymingWords[0]
        currentWord = 0
    }
    
    @IBAction func changeWord(sender: UIBarButtonItem){
        currentWord += 1
        sender.title = rhyme.rhymingWords[currentWord % rhyme.rhymingWords.count]
    }
    
    @IBAction func quit(sender: UIButton) {
        performSegueWithIdentifier("backToHome", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("init")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
        //dismissViewControllerAnimated(true, completion: nil)
    }
    

}
