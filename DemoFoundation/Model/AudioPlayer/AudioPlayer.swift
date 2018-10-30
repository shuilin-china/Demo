//
//  AudioPlayer.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//播放器状态
enum AudioPlayer_State {
    case AudioPlayer_None
    case AudioPlayer_Starting
    case AudioPlayer_Started
    case AudioPlayer_Stopping
    case AudioPlayer_Stopped
}


//播放器基类
class AudioPlayer: NSObject {

    var state : AudioPlayer_State = .AudioPlayer_None
    
    func start()
    {
        
    }
    
    func stop()
    {
        
    }
}

