//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/14/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var correctCount = Int()
    var total = Int()
    var descriptions = ["Better luck next time!", "Almost!","Perfect score!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if correctCount == total {
            descriptionLabel.text = descriptions[2]
        } else if correctCount > total / 2 {
            descriptionLabel.text = descriptions[1]
        } else {
            descriptionLabel.text = descriptions[0]
        }
        countLabel.text = "\(correctCount) out of \(total)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
