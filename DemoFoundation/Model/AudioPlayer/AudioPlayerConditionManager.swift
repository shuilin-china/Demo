//
//  AudioPlayerConditionManager.swift
//  Demo
//
//  Created by Foryou on 2018/10/30.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class AudioPlayerConditionManager: NSObject, AudioPlayerManager {

    static let sharedInstance = AudioPlayerConditionManager()
    
    func startPlayer(player: AudioPlayer & ManagedAudioPlayer) {
        
        //检查条件
        //...
        
        player.managedStart(manager: self)
    }
    
    func stopPlayer(player: AudioPlayer & ManagedAudioPlayer) {
        
        player.managedStop(manager: self)
        
    }
}
