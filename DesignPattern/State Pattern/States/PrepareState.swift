//
//  PrepareState.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class PrepareState: VideoStateType {
    weak var context: VideoContext?
    
    weak var controllerView: VideoControllerView?
    
    weak var player: AVPlayer? 
    
    init() {}
    
    init(_ context: VideoContext?, player: AVPlayer?, controllerView: VideoControllerView?) {
        self.context = context
        self.controllerView = controllerView
        self.player = player
        
        configViews()
    }
    
    private func configViews() {
        self.controllerView?.seekBar.minimumValue = 0
        if player?.currentItem?.duration.seconds.isNaN ?? true {
            self.controllerView?.seekBar.maximumValue = 0
            self.controllerView?.rightTimeLabel.text = "00:00:00"
        } else {
            let duration = Float(player?.currentItem?.asset.duration.seconds ?? 0)
            self.controllerView?.seekBar.maximumValue = duration
            self.controllerView?.duration = Double(duration)
        }
        self.controllerView?.seekBar.value = 0
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
