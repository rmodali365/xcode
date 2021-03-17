//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falsebutton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.backgroundColor = UIColor.clear
              }
        }
        else{
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.backgroundColor = UIColor.clear
              }
        }
       
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        
    }

    
    

}

