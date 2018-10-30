//
//  AudioPlayerStateManager.swift
//  Demo
//
//  Created by Foryou on 2018/10/29.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class AudioPlayerStateManager: NSObject ,AudioPlayerManager {

    static let sharedInstance = AudioPlayerStateManager()
    
    func startPlayer(player : AudioPlayer & ManagedAudioPlayer) {
        if player.state == .AudioPlayer_None || player.state == .AudioPlayer_Stopped || player.state == .AudioPlayer_Stopping {
            player .managedStart(manager: self)
            
        }
        else{
            print("重复开始")
        }
    }
    
    func stopPlayer(player : AudioPlayer & ManagedAudioPlayer) {
        if player.state == .AudioPlayer_Starting || player.state == .AudioPlayer_Started {
            player.managedStop(manager: self)
            
        }
        else {
            print("重复停止")
        }
    }
    
}
