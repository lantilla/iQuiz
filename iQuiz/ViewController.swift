//
//  ViewController.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/7/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions: Subject!
    var correct = 0
    var currentQuestion = 0
    var subjects: [Subject] = []
    var images = ["science", "marvel", "calculator"]
    @IBOutlet weak var tableView: UITableView!
    let url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
        
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
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
        let subject = subjects[indexPath.row].title
        cell?.textLabel?.text = subject
        // adding image icon to cell
        var img = "default"
        if indexPath.row < images.count {
            img = images[indexPath.row]
        }
        cell?.imageView?.image = UIImage(named: img)
        // adding description as subtitle to cell
        let desc = subjects[indexPath.row].description
        cell?.detailTextLabel?.text = desc
        //cell?.detailTextLabel?.numberOfLines = 0; // meant to wrap description text
        NSLog(subject)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = subjects[indexPath.row]
        questions = subject
        self.performSegue(withIdentifier: "questionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "settingsSegue" {
            let destVC : QuestionViewController = segue.destination as! QuestionViewController
            destVC.correctCount = correct
            destVC.questions = questions
        }
        if segue.identifier == "settingsSegue" {
            let vc = ViewController()
            vc.modalPresentationStyle = .popover
            //change properties of the view controller
            //vc.text = "Settings"
            //present from a view and rect
            present(vc, animated: true, completion: nil)
            vc.popoverPresentationController?.sourceView = view
        }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    /*@IBAction func openSettings(_ sender: Any) {
        let vc = SettingsViewController()
        //present from a view and rect
        vc.modalPresentationStyle = .popover //presentation style
        present(vc, animated: true, completion: nil)
        vc.popoverPresentationController?.sourceView = view
    }*/
    
    @IBAction func returnToMain(segue: UIStoryboardSegue) {
        NSLog("back in the ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        downloadJSON()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "subjectCell")
    }
    
    public func downloadJSON() {
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonInitial = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(jsonInitial)
                let json = jsonInitial as! [[String:Any]]
                
                
                //print(json)
                
                for subject in json {
                    var ques = subject["questions"] as! [[String : Any]]
                    ques = NSMutableArray(array: ques) as! [[String : Any]]
                    let cat = Subject(title: subject["title"]! as! String, description: subject["desc"]! as! String, questions: ques)
                    self.subjects.append(cat)
                }
            } catch let error as NSError {
                print(error)
            }
            
        }).resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

