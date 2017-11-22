//
//  Subject.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/21/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import Foundation

class Subject {
    let title: String
    let description: String
    let questions: [[String:Any]]
    
    init(title: String, description: String, questions: [[String:Any]]) {
        self.title = title
        self.description = description
        self.questions = questions
    }
}

