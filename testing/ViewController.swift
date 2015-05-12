//
//  ViewController.swift
//  testing
//
//  Created by Anil on 12/05/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation


let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
let theFileName = "/Post.wav"
let str = documentsFolder.stringByAppendingPathComponent(theFileName)
var url1 = NSURL.fileURLWithPath(str as String)


class ViewController: UIViewController {
    
    var audioRecorder : AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playaudio(sender: UIButton) {
        
        audioPlayer = AVAudioPlayer(contentsOfURL:url1, error: nil)
        if let audio = audioPlayer {
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            NSLog("working")
        }else {
            println("There was an error: (er)")
        }
    }
    
    @IBAction func record(sender: UIButton) {
        
        var audioSession:AVAudioSession = AVAudioSession.sharedInstance()
        audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        audioSession.setActive(true, error: nil)
        
        
        var recordSettings = [AVFormatIDKey:kAudioFormatAppleIMA4,
            AVSampleRateKey:44100.0,
            AVNumberOfChannelsKey:2,AVEncoderBitRateKey:12800,
            AVLinearPCMBitDepthKey:16,
            AVEncoderAudioQualityKey:AVAudioQuality.Max.rawValue]
        
        //  println("url : \(url)")
        var error: NSError?
        
        audioRecorder = AVAudioRecorder(URL:url1, settings:nil, error: &error)
        println("url : \(url1)")
        
        if let e = error {
            println(e.localizedDescription)
        } else {
            
            audioRecorder.record()
        }
        
        
        
    }
    
    @IBAction func stopRecording(sender: UIButton) {
        audioRecorder.stop()
        println("stopped recording")
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

