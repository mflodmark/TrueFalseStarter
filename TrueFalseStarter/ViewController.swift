//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // Instance of swift files
    let questions = Questions()
    
    // Declarations
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var timeRemaining: Int = 15
    var timer = Timer()

    // Arrays
    var buttonsArray: [UIButton] = [UIButton]()

    // Outlets
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var constraintAnswer4: NSLayoutConstraint!
    @IBOutlet weak var heightAnswer4: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()

        // Start game
        playGameStartSound()
        displayQuestion(buttonTitle: "Next Question")
        
        
        // Creating array of buttons
        self.buttonsArray = [self.answer1, self.answer2, self.answer3, self.answer4]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Functions
    
    func displayQuestion(buttonTitle: String) {
        if questions.questionsAndAnswers.count == 0 {
            // Title
            playAgainButton.setTitle("Out of questions...", for: UIControlState.normal)
            hideAnswerButtons()
        } else {
            // Random question
            randomQuestion()
            
            // Set-up for buttons
            showAnswerButtons()
            
            //Timer
            timerStart()
            
            // Show play button
            playAgainButton.isHidden = true
            
            // Title for play again or next question button
            playAgainButton.setTitle(buttonTitle, for: UIControlState.normal)
            
            // Button set-up
            buttonSetUp()
            }
    }
    
    func randomQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: questions.questionsAndAnswers.count)
        let questionDictionary = questions.questionsAndAnswers[indexOfSelectedQuestion]
        
        // Set text related to buttons
        questionField.text = questionDictionary.question
        answer1.setTitle(questionDictionary.answer1, for: UIControlState.normal)
        answer2.setTitle(questionDictionary.answer2, for: UIControlState.normal)
        answer3.setTitle(questionDictionary.answer3, for: UIControlState.normal)
        answer4.setTitle(questionDictionary.answer4, for: UIControlState.normal)
    }

    func timerStart() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountdown), userInfo: nil, repeats: true)
        
        // Starting time
        timeRemaining = 15
    }
    
    func timerCountdown() {
        // Updating label text with timer countdown
        label.text = (timeRemaining).description
        
        // Stop timer & go to next question if 0
        if timeRemaining == 0 {
            // Must invalidate timer before starting a new round, otherwise it becomes a new timer all the time
            timer.invalidate()
            nextRound()
        } else {
            timeRemaining -= 1
        }
        
    }
    
    func buttonSetUp() {
        // Rounded corners
        answer1.layer.cornerRadius = 5
        answer2.layer.cornerRadius = 5
        answer3.layer.cornerRadius = 5
        answer4.layer.cornerRadius = 5
        playAgainButton.layer.cornerRadius = 5
    }
    
    func hideAnswerButtons() {
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        label.text = ""
    }
    
    
    func showAnswerButtons() {
        for button in buttonsArray {
            if button.title(for: UIControlState.normal) == "" {
                button.isHidden = true
                heightAnswer4.constant = 0
                constraintAnswer4.constant = 0
            } else {
                button.isHidden = false
                // Opacity for button
                button.alpha = 1
                heightAnswer4.constant = 50
                constraintAnswer4.constant = 20
            }
        }
        label.text = ""
    }
 
    
    func displayScore() {
        // Hide the answer buttons
        hideAnswerButtons()
        label.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        // Title for play again or next question button
        playAgainButton.setTitle("Play again", for: UIControlState.normal)
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            questions.questionsAndAnswers.remove(at: indexOfSelectedQuestion)
            displayQuestion(buttonTitle: "Next Question")
        }
    }
    
    func correctAnswered() {
        correctQuestions += 1
        label.isHidden = false
        label.text = "Correct!"
        label.textColor = UIColor.green
    }
    
    func incorrectAnswered() {
        label.isHidden = false
        label.text = "Sorry, wrong answer!"
        label.textColor = UIColor.orange
    }
    
    func questionButton(button: String) {
        // check correct answer button and amend the other buttons
        var counter: Int = 0
        for _ in buttonsArray {
            if button == buttonsArray[counter].title(for: UIControlState.normal) {
                // don't do anything
            } else {
                // change opacity of other buttons
                buttonsArray[counter].alpha = 0.2
            }
            counter += 1
        }
    }
    
    // MARK: Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        // Correct answer
        let selectedQuestionDict = questions.questionsAndAnswers[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.correctAnswer
        questionButton(button: correctAnswer)
        
        // Show next question button
        playAgainButton.isHidden = false
        
        // Stop timer
        timer.invalidate()
        
        if (sender.currentTitle == correctAnswer) {
            
            // Set-up after correct answer
            correctAnswered()
            
            // Sound
            correctAnswerSound()
            
         } else {
            // Set-up after correct answer
            incorrectAnswered()
            
            // Sound
            incorrectAnswerSound()
         }
    }
    

    @IBAction func nextQuestion(_ sender: UIButton) {
        if (sender.currentTitle == "Next Question") {
            loadNextRoundWithDelay(seconds: 1)
        } else if (sender.currentTitle == "Out of questions...") {
            // do nothing
        } else {
            // Show the answer buttons
            showAnswerButtons()
    
            questionsAsked = 0
            correctQuestions = 0
            nextRound()
            }
        }
    

    
    // MARK: Helper Methods
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
}



