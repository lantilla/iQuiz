//
//  ViewController.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/7/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions: [Dictionary<String, String>] = [[:]]
    var correct = 0
    var currentQuestion = 0
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.shared.delegate as! AppDelegate).subjects.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        }
        // adding subject title to cell
        let subject = (UIApplication.shared.delegate as! AppDelegate).subjects[indexPath.row]
        cell?.textLabel?.text = subject
        // adding image icon to cell
        let img = (UIApplication.shared.delegate as! AppDelegate).subjectsInfo[subject]!["image"]
        cell?.imageView?.image = UIImage(named: img!)
        // adding description as subtitle to cell
        let desc = (UIApplication.shared.delegate as! AppDelegate).subjectsInfo[subject]!["desc"]
        cell?.detailTextLabel?.text = desc
        //cell?.detailTextLabel?.numberOfLines = 0; // meant to wrap description text
        NSLog(subject)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = (UIApplication.shared.delegate as! AppDelegate).subjects[indexPath.row]
        NSLog("You selected cell number: \(subject)!")
        if subject == "Mathematics" {
            questions = (UIApplication.shared.delegate as! AppDelegate).mathematics
        } else if subject == "Science" {
            questions = (UIApplication.shared.delegate as! AppDelegate).science
        } else {
            questions = (UIApplication.shared.delegate as! AppDelegate).marvel
        }
        self.performSegue(withIdentifier: "questionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : QuestionViewController = segue.destination as! QuestionViewController
        destVC.correctCount = correct
        destVC.questions = questions
    }
    
    @IBAction func returnToMain(segue: UIStoryboardSegue) {
        NSLog("back in the ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "subjectCell")
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
    
}

