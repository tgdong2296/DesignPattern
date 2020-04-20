//
//  StatePatternViewController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit
import AVFoundation

class StatePatternViewController: UIViewController {
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoControllerView: VideoControllerView!
    
    var mediaItem: AVPlayerItem!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var context: VideoContext?
    
    private var observer: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        loadVideo()
    }
    
    func configViews() {
        videoControllerView.delegate = self
    }
    
    func loadVideo() {
        let urlPath = Bundle.main.path(forResource: "nguoi_tinh_mua_dong", ofType: "mp4") ?? ""
        let videoURL = URL(fileURLWithPath: urlPath)
        mediaItem = AVPlayerItem(url: videoURL)
        self.observer = mediaItem.observe(\.status, options:  [.new, .old]) { [weak self] (playerItem, change) in
            guard let self = self else { return }
            if playerItem.status == .readyToPlay {
                self.prepareState()
            }
        }
        self.player = AVPlayer(playerItem: self.mediaItem)
        self.playerLayer = AVPlayerLayer(player: self.player)
        self.videoView.layer.insertSublayer(self.playerLayer, at: 0)
        self.playerLayer.frame = self.videoView.bounds
    }
    
    func prepareState() {
        context = VideoContext(player: self.player, controllerView: self.videoControllerView)
    }
    
    func releasePlayer() {
        player.pause()
        player = nil
    }
    
    deinit {
        releasePlayer()
        observer?.invalidate()
    }
}

extension StatePatternViewController: VideoControllerViewDelegate {
    
    func videoControllerPlayPauseTapped(_ videoControllerView: VideoControllerView, button: UIButton) {
        context?.togglePlayPause()
    }
    
    func videoControllerSliderValueChangedBegin(_ videoControllerView: VideoControllerView,
                                                slider: UISlider,
                                                value: Double) {
        context?.changeStateToSeekBegin()
        context?.changeStateToSeeking()
    }
    
    func videoControllerSliderValueChanged(_ videoControllerView: VideoControllerView,
                                           slider: UISlider,
                                           value: Double) {
        context?.valueChanged(value)
    }
    
    func videoControllerSliderValueChangedEnd(_ videoControllerView: VideoControllerView,
                                              slider: UISlider,
                                              value: Double) {
        context?.changeStateToSeekEnd()
        context?.seek(to: value)
    }
}

extension StatePatternViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.state
}
