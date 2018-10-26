//
//  AudioFilePlayer.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//播放文件的
class AudioFilePlayer: AudioPlayer {

    var url : String = ""
    
    override func start()
    {
        print("开始播放 url : \(self.url)")
    }
    
    override func stop()
    {
        print("停止播放 url : \(self.url)")
    }
    
}
