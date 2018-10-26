//
//  MusicPlayer.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class MusicPlayer: AudioPlayer {

    var musicID : String = ""
    
    let filePlayer = AudioFilePlayer()
    
    override func start() {
        
        //根据musicID获取url
        
        //...
        
        let url = "http://xxx.com/demo.mp3"
        self.filePlayer.url = url
        self.filePlayer.start()
    }
    
    override func stop() {
        
        self.filePlayer.stop()
    }
}
