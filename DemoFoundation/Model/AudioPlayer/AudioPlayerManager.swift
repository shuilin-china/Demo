//
//  AudioPlayerManager.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

//可被管理的播放器
protocol ManagedAudioPlayer {
    
    //被管理器控制后的start
    func managedStart(manager:AudioPlayerManager)
    
    //被管理器控制后的stop
    func managedStop(manager:AudioPlayerManager)
}


//播放管理器接口
protocol AudioPlayerManager {
    
    func startPlayer(player : AudioPlayer & ManagedAudioPlayer)
    
    func stopPlayer(player : AudioPlayer & ManagedAudioPlayer)
}


