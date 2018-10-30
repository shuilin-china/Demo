//
//  ManagedMusicPlayer.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class ManagedMusicPlayer: MusicPlayer, ManagedAudioPlayer {

    override func start() {
        
        AudioPlayerStateManager.sharedInstance.startPlayer(player: self)
    }
    
    override func stop() {
    
        AudioPlayerStateManager.sharedInstance.stopPlayer(player: self)
    }
    
    func managedStart(manager:AudioPlayerManager) {
        
        if let temp = manager as? AudioPlayerStateManager {
            if temp == AudioPlayerStateManager.sharedInstance{
                
                //再检查条件
                AudioPlayerConditionManager.sharedInstance.startPlayer(player: self)
            }
            
        }
        else if let temp = manager as? AudioPlayerConditionManager {
            if temp == AudioPlayerConditionManager.sharedInstance{
                
                super.start()
            }
            
        }
    }
    
    func managedStop(manager:AudioPlayerManager) {
        if let temp = manager as? AudioPlayerStateManager {
            if temp == AudioPlayerStateManager.sharedInstance{
                
                //再检查条件
                AudioPlayerConditionManager.sharedInstance.stopPlayer(player: self)
            }
            
        }
        else if let temp = manager as? AudioPlayerConditionManager {
            if temp == AudioPlayerConditionManager.sharedInstance{
                
                super.stop()
            }
            
        }
        
    }
}
