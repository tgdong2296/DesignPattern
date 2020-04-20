//
//  StatePatternContext.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class VideoContext {
    weak var player: AVPlayer? {
        didSet {
            self.state.player = self.player
        }
    }
    
    weak var controllerView: VideoControllerView? {
        didSet {
            self.state.controllerView = self.controllerView
        }
    }
    
    private var state: VideoStateType = PrepareState()
    
    init(player: AVPlayer?, controllerView: VideoControllerView?) {
        self.player = player
        self.controllerView = controllerView
        self.state = PrepareState(self, player: player, controllerView: controllerView)
    }
    
    func togglePlayPause() {
        state.togglePlayPause()
    }
    
    func valueChanged(_ value: Double) {
        state.seeking(to: value)
    }
    
    func seek(to value: Double) {
        self.state.seek(to: value)
    }
}

// MARK: - Change states
extension VideoContext {
    
    func changeStateToPrepare() {
        print("LOG + \(#function)")
        self.state = PrepareState(self, player: player, controllerView: controllerView)
    }
    
    func changeStateToPlay() {
        print("LOG + \(#function)")
        self.state = PlayingState(self, player: player, controllerView: controllerView)
    }
    
    func changeStateToPause() {
        print("LOG + \(#function)")
        self.state = PauseState(self, player: player, controllerView: controllerView)
    }
    
    func changeStateToSeekBegin() {
        print("LOG + \(#function)")
        self.state = SeekBeginState(self, player: player, controllerView: controllerView)
    }
    
    func changeStateToSeeking() {
        print("LOG + \(#function)")
        self.state = SeekingState(self, player: player, controllerView: controllerView)
    }
    
    func changeStateToSeekEnd() {
        print("LOG + \(#function)")
        self.state = SeekEndState(self, player: player, controllerView: controllerView)
    }
}
