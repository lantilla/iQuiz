//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/13/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var questions:Subject!
    var correctCount = Int()
    var chosenAns = String()
    var currentQuestion = Int()
    var ques: [String] = []
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var option4Btn: UIButton!
    var formerBtn = UIButton()
    var optionSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog(String(describing: questions.questions))
        questionLabel.text = questions.questions[currentQuestion]["text"] as? String
        ques = questions.questions[currentQuestion]["answers"] as! [String]
        ques = NSMutableArray(array: ques) as! [String]
        option1Btn.setTitle(ques[0], for: .normal)
        option2Btn.setTitle(ques[1], for: .normal)
        option3Btn.setTitle(ques[2], for: .normal)
        option4Btn.setTitle(ques[3], for: .normal)
        option1Btn.backgroundColor = .gray
        option2Btn.backgroundColor = .gray
        option3Btn.backgroundColor = .gray
        option4Btn.backgroundColor = .gray
        //option1Label.layer.cornerRadius = 5
        //option1Label.clipsToBounds = true
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
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        if optionSelected == true {
            self.performSegue(withIdentifier: "answerSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answerSegue" {
            let destVC : AnswerViewController = segue.destination as! AnswerViewController
            destVC.questions = questions
            destVC.chosenAns = chosenAns
            destVC.currentQuestion = currentQuestion
            destVC.correctCount = correctCount
        }
    }
    
    @IBAction func returnToQuestion(segue: UIStoryboardSegue) {
        NSLog("back in the QuestionViewController")
        NSLog(String(currentQuestion))
        questionLabel.text = questions.questions[currentQuestion]["text"] as? String
        ques = questions.questions[currentQuestion]["answers"] as! [String]
        ques = NSMutableArray(array: ques) as! [String]
        option1Btn.setTitle(ques[0], for: .normal)
        option2Btn.setTitle(ques[1], for: .normal)
        option3Btn.setTitle(ques[2], for: .normal)
        option4Btn.setTitle(ques[3], for: .normal)
        formerBtn.backgroundColor = .gray
        optionSelected = false
    }
    
    
    @IBAction func optionPressed(_ sender: UIButton) {
        optionSelected = true
        chosenAns = sender.titleLabel!.text!
        formerBtn.backgroundColor = .gray
        sender.backgroundColor = UIColor(hue: 0.6472, saturation: 0.08, brightness: 0.15, alpha: 1.0)
        formerBtn = sender
        NSLog(chosenAns)
    }
    
    @IBAction func rightSwipe(_ sender: Any) {
        self.performSegue(withIdentifier: "answerSegue", sender: nil)
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
