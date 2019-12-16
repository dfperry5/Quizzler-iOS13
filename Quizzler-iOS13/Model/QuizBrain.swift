//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Dylan Perry on 12/16/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", choices: ["True", "False"], a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", choices: ["True", "False"], a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", choices: ["True", "False"],  a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", choices: ["True", "False"], a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", choices: ["True", "False"], a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", choices: ["True", "False"], a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", choices: ["True", "False"], a: "False"),
        Question(q: "Google was originally called 'Backrub'.", choices: ["True", "False"], a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", choices: ["True", "False"], a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", choices: ["True", "False"], a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", choices: ["True", "False"], a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", choices: ["True", "False"], a: "True"),
        Question(q: "Which is the largest organ in the human body?", choices: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", choices: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", choices: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", choices: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", choices: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", choices: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", choices: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", choices: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", choices: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", choices: ["Indonesia", "Australia", "Scotland"], a: "Australia")
        
        
    ]
    
    var questionNumber = 0
    lazy var questionInContext = quiz[questionNumber]
    var questionsCorrect = 0
    
    mutating func incrementQuestion(){
        if (questionNumber + 1 < quiz.count){
            self.questionNumber += 1
            self.questionInContext = quiz[questionNumber]
        } else {
            restart()
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if self.questionInContext.checkAnswer(userAnswer){
            self.questionsCorrect += 1
            return true
        } else {
            return false
        }
    }
    
    func calculateProgress() -> Float {
        return Float(questionNumber+1) / Float(quiz.count)
    }
    
    mutating func calculatePercentage() -> Double {
        if (questionNumber == 0){
            return 0.0
        } else {
            return Double(Double(questionsCorrect) / Double(questionNumber) * 100)
        }
    }
    
    mutating func restart(){
        self.questionNumber = 0
        self.questionsCorrect = 0
        self.questionInContext = quiz[questionNumber]
        
    }
}
