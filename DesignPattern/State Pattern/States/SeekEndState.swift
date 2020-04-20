//
//  SeekEndState.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class SeekEndState: VideoStateType {
    weak var context: VideoContext?
    
    weak var controllerView: VideoControllerView?
    
    weak var player: AVPlayer?
    
    init() {}
    
    init(_ context: VideoContext?, player: AVPlayer?, controllerView: VideoControllerView?) {
        self.context = context
        self.player = player
        self.controllerView = controllerView
    }
    
    func togglePlayPause() {
        // don't perform any action during drag seekBar
        return
    }
    
    func seeking(to value: Double) {
        return
    }
    
    func seek(to value: Double) {
        let time = CMTime(value: CMTimeValue(value), timescale: 1)
        player?.seek(to: time)
        context?.changeStateToPlay()
    }
}
