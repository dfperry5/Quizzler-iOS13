//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Dylan Perry on 12/16/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var answer: String
    var question: String
    var answerChoices: [String]
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        return userAnswer == answer
    }
    
    init(q: String, choices: [String], a: String){
        answer = a
        question = q
        answerChoices = choices
    }
}



extension String {
var boolValue: Bool {
    return (self as NSString).boolValue
}}
