//
//  DailyEmotionViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit
import TagListView

class DailyEmotionViewController: UIViewController, TagListViewDelegate {
    
    let tags = ["피곤", "무감각", "지루함", "화남", "짜증", "압도감", "좌절감", "두려움", "불안정", "불안", "스트레스", "우울", "부끄러움", "죄책감"]
    var selectedTags = [String]()
    
    let purple = UIColor(red: 89/255.0, green: 90/255.0, blue: 219/255.0, alpha: 1.0)

    @IBOutlet weak var tagView: TagListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagView.delegate = self
        
        tagView.textFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        tagView.addTags(tags)
        
    }

    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        if selectedTags.contains(title) {
            tagView.selectedBorderColor = purple
            tagView.tagBackgroundColor = .white
            tagView.textColor = purple
            selectedTags.removeAll { $0 == title
            }
        } else {
            tagView.selectedBorderColor = purple
            tagView.tagBackgroundColor = purple
            tagView.textColor = .white
            selectedTags.append(title)
        }
    }


    @IBAction func nextClicked(_ sender: UIButton) {
        let cv = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DailyEmotionExtentViewController") as! DailyEmotionExtentViewController
        cv.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(cv, animated: true)
    }
}

