//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by LimJaemin on 2017. 1. 12..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    fileprivate var documentController: UIDocumentInteractionController?

    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
    func shareFile(_ localPath: URL?) {
        print("local path")
        print(localPath)
        
        if let localPath = localPath {
            documentController = UIDocumentInteractionController(url: localPath)
            documentController?.delegate = self
            documentController?.presentOptionsMenu(from: self.view.frame, in: self.view, animated: true)
        }
    }

    @IBAction func share(_ sender: Any) {
        
        let path = "\(recordedAudioURL!)"
        let urlString = "file://"+path
        let url = URL(string: urlString)
        
        shareFile(url)
    }

}
