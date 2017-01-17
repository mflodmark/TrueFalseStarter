//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Markus Flodmark on 2017-01-12.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit


// Question blueprint
struct QuestionSetUp {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctAnswer: String
}



class Questions {
    let questionsAndAnswers: [QuestionSetUp] = [
        QuestionSetUp(question: "Where have Zlatan not played?", answer1: "Malmö", answer2: "Barcelona", answer3: "Real Madrid", answer4: "Inter", correctAnswer: "Real Madrid"),
        QuestionSetUp(question: "Where did Zlatan have Zlatan on the back?", answer1: "Ajax", answer2: "Juventus", answer3: "Milan", answer4: "PSG", correctAnswer: "Ajax"),
        QuestionSetUp(question: "Zlatan new cloth brand?", answer1: "Ibrahimovic", answer2: "Zlatan", answer3: "Z", answer4: "A-Z", correctAnswer: "A-Z"),
        QuestionSetUp(question: "What year is Zlatan born?", answer1: "1979", answer2: "1980", answer3: "1981", answer4: "1981", correctAnswer: "1981"),
        QuestionSetUp(question: "Zlatan club goals of 2016?", answer1: "30", answer2: "40", answer3: "50", answer4: "60", correctAnswer: "50"),
        QuestionSetUp(question: "Zlatans deput in Ajax?", answer1: "1999", answer2: "2001", answer3: "2002", answer4: "", correctAnswer: "2001"),
        QuestionSetUp(question: "How many children does Zlatan have?", answer1: "0", answer2: "1", answer3: "2", answer4: "3", correctAnswer: "3"),
        QuestionSetUp(question: "Who is the best player?", answer1: "Zlatan", answer2: "Ronaldo", answer3: "Messi", answer4: "Markus", correctAnswer: "Markus")
    ]
}



            /*
            "Question": "Where have Zlatan not played?",
         "Answer1": "Malmö",
         "Answer2": "Barcelona",
         "Answer3": "Real Madrid",
         "Answer4": "Inter",
         "CorrectAnswer": "Real Madrid"],
        
        ["Question": "Where did Zlatan have Zlatan on the back?",
         "Answer1": "Ajax",
         "Answer2": "Juventus",
         "Answer3": "Milan",
         "Answer4": "PSG",
         "CorrectAnswer": "Ajax"],
        
        ["Question": "Zlatan new cloth brand?",
         "Answer1": "Ibrahimovic",
         "Answer2": "Zlatan",
         "Answer3": "Z",
         "Answer4": "A-Z",
         "CorrectAnswer": "A-Z"],
        
        ["Question": "What year is Zlatan born?",
         "Answer1": "1979",
         "Answer2": "1980",
         "Answer3": "1981",
         "Answer4": "1982",
         "CorrectAnswer": "1981"],
        
        ["Question": "Zlatan club goals of 2016?",
         "Answer1": "30",
         "Answer2": "40",
         "Answer3": "50",
         "Answer4": "60",
         "CorrectAnswer": "50"],
        
        ["Question": "Zlatan deput in Ajax?",
         "Answer1": "1999",
         "Answer2": "2001",
         "Answer3": "2002",
         "Answer4": "",
         "CorrectAnswer": "2001"],
        
        ["Question": "How many children does Zlatan have?",
         "Answer1": "0",
         "Answer2": "1",
         "Answer3": "2",
         "Answer4": "3",
         "CorrectAnswer": "2"],
        
        ["Question": "Who is the best player?",
         "Answer1": "Zlatan",
         "Answer2": "Ronaldo",
         "Answer3": "Messi",
         "Answer4": "Markus",
         "CorrectAnswer": "Markus"]
        */
 















