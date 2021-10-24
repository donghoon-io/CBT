//
//  DailyEmotionExtentViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class DailyEmotionExtentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recordMoreButton: UIButton!
    @IBOutlet weak var recordEndButton: UIButton!
    
    var selectedTags = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmotionTableViewCell", for: indexPath) as! EmotionTableViewCell
        cell.typeName = selectedTags[indexPath.item]
        cell.titleLabel.text = selectedTags[indexPath.item]
        cell.totalView.layer.cornerRadius = 10
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        recordMoreButton.layer.cornerRadius = recordMoreButton.frame.height/2.0
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0
    }
    @IBAction func recordEndClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func viewMoreClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DailyRecordCompleteViewController") as! DailyRecordCompleteViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
