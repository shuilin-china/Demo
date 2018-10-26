//
//  AudioPlayerManager.swift
//  Demo
//
//  Created by Foryou on 2018/10/26.
//  Copyright © 2018年 Foryou. All rights reserved.
//

import UIKit

class AudioPlayerManager: NSObject {
    
    static let sharedInstance = AudioPlayerManager()

    func startPlayer(player : AudioPlayer & ManagedAudioPlayer)
    {
        player.stop()
        player.managedStop()
    }
}


