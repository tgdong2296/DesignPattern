//
//  PlayerStateType.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import AVFoundation

protocol VideoStateType {
    var context: VideoContext? { get set }
    
    var controllerView: VideoControllerView? { get set }
    
    var player: AVPlayer? { get set }
    
    func togglePlayPause()
    
    func seeking(to value: Double)
    
    func seek(to value: Double)
}
