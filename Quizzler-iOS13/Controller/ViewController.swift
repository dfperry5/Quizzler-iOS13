//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    
    @IBOutlet weak var questionsAttemptedLabel: UILabel!
    @IBOutlet weak var questionsCorrectLabel: UILabel!
    @IBOutlet weak var percentCorrectLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    
    lazy var backgroundImage = self.optionTwoButton.currentBackgroundImage!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.updateUI()
    }
    
    @objc private func updateUI(){
        questionLabel.text = quizBrain.questionInContext.question
        progressBar.progress = quizBrain.calculateProgress()
        optionOneButton.backgroundColor = UIColor.clear
        optionTwoButton.backgroundColor = UIColor.clear
        optionThreeButton.backgroundColor = UIColor.clear
        
        
        questionsCorrectLabel.text = "Correct: \(quizBrain.questionsCorrect)"
        questionsAttemptedLabel.text = "Attempted: \(quizBrain.questionNumber)"
        percentCorrectLabel.text = "Percentage \(quizBrain.calculatePercentage())%"
        
        var btnArray : [UIButton] = []
        if quizBrain.questionInContext.answerChoices.count == 3 {
            btnArray = [optionOneButton, optionTwoButton, optionThreeButton]
        } else {
            optionOneButton.isHidden = true
            btnArray = [optionTwoButton, optionThreeButton]
        }
        
        for (index, choice) in quizBrain.questionInContext.answerChoices.enumerated() {
            btnArray[index].setTitle(choice, for: .normal)
            btnArray[index].isHidden = false
        }
        
        
        
    }
    
    private func finishGame(){
        questionLabel.text = "Game Over!"
    }
        
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
                
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.incrementQuestion()
        
    }
    
}

