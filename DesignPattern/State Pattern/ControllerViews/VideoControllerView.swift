//
//  VideoControllerView.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/20/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import Foundation
import SnapKit

@objc protocol VideoControllerViewDelegate: class {
    @objc optional func videoControllerPlayPauseTapped(_ videoControllerView: VideoControllerView, button: UIButton)
    @objc optional func videoControllerSliderValueChangedBegin(_ videoControllerView: VideoControllerView,
                                                               slider: UISlider,
                                                               value: Double)
    @objc optional func videoControllerSliderValueChanged(_ videoControllerView: VideoControllerView,
                                                          slider: UISlider,
                                                          value: Double)
    @objc optional func videoControllerSliderValueChangedEnd(_ videoControllerView: VideoControllerView,
                                                             slider: UISlider,
                                                             value: Double)
}

class VideoControllerView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var seekBar: UISlider!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var rightTimeLabel: UILabel!
    
    weak var delegate: VideoControllerViewDelegate?
    
    var isPlaying: Bool = false {
        didSet {
            playPauseButton.setImage(isPlaying ? #imageLiteral(resourceName: "ic_pause") : #imageLiteral(resourceName: "ic_play"), for: .normal)
        }
    }
    
    var progress: Double = 0.0 {
        didSet {
            leftTimeLabel.text = progress.secondsToHoursMinutesSeconds
            seekBar.value = Float(progress)
        }
    }
    
    var duration: Double = 0.0 {
        didSet {
            rightTimeLabel.text = duration.secondsToHoursMinutesSeconds
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("VideoControllerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        contentView.backgroundColor = .clear
    }
    
    @IBAction func handlePlayPauseButtonTapped(_ sender: UIButton) {
        delegate?.videoControllerPlayPauseTapped?(self, button: sender)
    }
    
    @IBAction func handleSeekBarValueChanged(_ sender: UISlider, event: UIEvent) {
        guard let touchEvent = event.allTouches?.first else { return }
        switch touchEvent.phase {
        case .began:
            delegate?.videoControllerSliderValueChangedBegin?(self, slider: sender, value: Double(sender.value))
        case .moved:
            delegate?.videoControllerSliderValueChanged?(self, slider: sender, value: Double(sender.value))
        case .ended:
            delegate?.videoControllerSliderValueChangedEnd?(self, slider: sender, value: Double(sender.value))
        default:
            break
        }
    }
}

extension Double {
    
    var secondsToHoursMinutesSeconds: String {
        let (h, m, s) = secondsToHoursMinutesSeconds(seconds: self)
        return "\(h):\(m):\(s)"
    }
    
    func secondsToHoursMinutesSeconds(seconds : Double) -> (Int, Int, Int) {
        let intSeconds = Int(seconds)
        return (intSeconds / 3600, (intSeconds % 3600) / 60, (intSeconds % 3600) % 60)
    }
}
