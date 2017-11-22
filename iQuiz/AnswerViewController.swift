//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/13/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var questions:Subject!
    var correctCount = Int()
    var chosenAns = String()
    var currentQuestion = Int()
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ans = questions.questions[currentQuestion]["answers"] as! [String]
        ans = NSMutableArray(array: ans) as! [String]
        questionLabel.text = questions.questions[currentQuestion]["text"] as? String
        answerLabel.text = ans[Int(questions.questions[currentQuestion]["answer"] as! String)! - 1]
        userAnswerLabel.text = chosenAns
        if userAnswerLabel.text == answerLabel.text {
            userAnswerLabel.textColor = UIColor(hue: 0.3778, saturation: 1, brightness: 0.62, alpha: 1.0)
            correctCount += 1
        } else {
            userAnswerLabel.textColor = UIColor.red
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishedSegue" {
            let destVC : FinishedViewController = segue.destination as! FinishedViewController
            destVC.correctCount = correctCount
            destVC.total = questions.questions.count
        } else if segue.identifier == "nextQuestionSegue" {
            let destVC : QuestionViewController = segue.destination as! QuestionViewController
            destVC.currentQuestion = currentQuestion
            destVC.correctCount = correctCount
        }
    }
    
    
    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        currentQuestion += 1
        NSLog(String(currentQuestion))
        if questions.questions.count != currentQuestion {
            self.performSegue(withIdentifier: "nextQuestionSegue", sender: self)
        } else {
            self.performSegue(withIdentifier: "finishedSegue", sender: self)
        }
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
