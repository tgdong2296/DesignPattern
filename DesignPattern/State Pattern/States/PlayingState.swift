//
//  PlayingState.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

class PlayingState: VideoStateType {
    weak var context: VideoContext?
    
    weak var controllerView: VideoControllerView?
    
    weak var player: AVPlayer? {
        didSet {
            removeObserver()
            addObserver()
        }
    }
    
    private var timeObserver: Any?
    
    init() {}
    
    init(_ context: VideoContext?, player: AVPlayer?, controllerView: VideoControllerView?) {
        self.context = context
        self.player = player
        self.controllerView = controllerView
        
        addObserver()
        
        self.controllerView?.isPlaying = true
    }
    
    deinit {
        removeObserver()
    }
    
    func addObserver() {
        let time = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player?.addPeriodicTimeObserver(forInterval: time, queue: .main) { [weak self] time in
            guard let self = self else { return }
            self.controllerView?.progress = time.seconds
        }
    }
    
    func removeObserver() {
        guard let timeObserver = timeObserver else { return }
        player?.removeTimeObserver(timeObserver)
    }
    
    func togglePlayPause() {
        player?.pause()
        context?.changeStateToPause()
    }
    
    func seeking(to value: Double) {
        return
    }
    
    func seek(to value: Double) {
        return
    }
}
