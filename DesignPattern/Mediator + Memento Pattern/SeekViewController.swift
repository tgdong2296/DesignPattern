//
//  SeekViewController.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/7/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit

class SeekViewController: UIViewController, MediatorType {
    @IBOutlet weak var titleScreen: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var seekBar: UISlider!
    @IBOutlet weak var isPlayingSwitch: UISwitch!
    
    /// State using for synchronize.
    var state: SeekState = SeekState()
    
    var mediator: MediatorType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleScreen.text = title
    }
    
    /// This func set initial state for this ViewController.
    private func initState() {
        state.isPlaying = isPlayingSwitch.isOn
        state.value = seekBar.value
    }
    
    /// This func will call when State is updated.
    /// - Parameters:
    ///   - sender: Originator object in Memento Pattern wich has State need to be set to another object.
    ///   - state: State need to be updated.
    func stateChange(sender: UIViewController, to state: SeekState) {
        guard self !== sender else { return }
        self.state = state
    }
    
    @IBAction func handleWitchAction(_ sender: UISwitch) {
        // Memento Pattern: save State.
        state.isPlaying = sender.isOn
        
        // Mediator Pattern: Notify to other object.
        mediator?.stateChange(sender: self, to: state)
    }
    
    @IBAction func handleSeekBarValue(_ sender: UISlider) {
        percentLabel.text = "\(Int(sender.value))"
        
        // Memento Pattern: save State.
        state.value = sender.value
        
        // Mediator Pattern: Notify to other object.
        mediator?.stateChange(sender: self, to: state)
    }
}

extension SeekViewController: Originator {
    
    /// This func will update an object with new State.
    /// - Parameter state: Newest State need to be updated in Object.
    func synchronize(by state: SeekState) {
        percentLabel.text = "\(Int(state.value))"
        seekBar.value = state.value
        isPlayingSwitch.isOn = state.isPlaying
    }
}

extension SeekViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.mediator
}
