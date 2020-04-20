//
//  SeekingState.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class SeekingState: VideoStateType {
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
        controllerView?.progress = value
    }
    
    func seek(to value: Double) {
        return
    }
}
