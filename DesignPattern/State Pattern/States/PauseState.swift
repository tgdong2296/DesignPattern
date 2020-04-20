//
//  PauseState.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class PauseState: VideoStateType {
    weak var context: VideoContext?
    
    weak var controllerView: VideoControllerView?
    
    weak var player: AVPlayer?
    
    init() {}
    
    init(_ context: VideoContext?, player: AVPlayer?, controllerView: VideoControllerView?) {
        self.context = context
        self.player = player
        self.controllerView = controllerView
        
        self.controllerView?.isPlaying = false
    }
    
    func togglePlayPause() {
        player?.play()
        context?.changeStateToPlay()
    }
    
    func seeking(to value: Double) {
        return
    }
    
    func seek(to value: Double) {
        return
    }
}
