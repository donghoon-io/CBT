//
//  EmotionTableViewCell.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class EmotionTableViewCell: UITableViewCell {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var typeName = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.currentLabel.text = "슬라이더를 이동해서 기록해주세요"
        
        slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
    }
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            default:
                currentLabel.text = generateText(value: slider.value)
            }
        }
    }
    
    func generateText(value: Float) -> String {
        switch value {
        case 0..<0.33: return "적은 수준의 \(typeName)을 느꼈습니다"
        case 0.33..<0.66: return "평범한 수준의 \(typeName)을 느꼈습니다"
        default: return "많은 수준의 \(typeName)을 느꼈습니다"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
