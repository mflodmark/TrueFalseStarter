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
    var questionsAndAnswers: [QuestionSetUp] = [
        QuestionSetUp(question: "Where have Zlatan not played?", answer1: "Malmö", answer2: "Barcelona", answer3: "Real Madrid", answer4: "Inter", correctAnswer: "Real Madrid"),
        QuestionSetUp(question: "Where did Zlatan have Zlatan on the back?", answer1: "Ajax", answer2: "Juventus", answer3: "Milan", answer4: "", correctAnswer: "Ajax"),
        QuestionSetUp(question: "Zlatan new cloth brand?", answer1: "Ibrahimovic", answer2: "Zlatan", answer3: "Z", answer4: "A-Z", correctAnswer: "A-Z"),
        QuestionSetUp(question: "W=hat year is Zlatan born?", answer1: "1979", answer2: "1980", answer3: "1981", answer4: "", correctAnswer: "1981"),
        QuestionSetUp(question: "Zlatan club goals of 2016?", answer1: "30", answer2: "40", answer3: "50", answer4: "60", correctAnswer: "50"),
        QuestionSetUp(question: "Zlatans deput in Ajax?", answer1: "1999", answer2: "2001", answer3: "2002", answer4: "", correctAnswer: "2001"),
        QuestionSetUp(question: "How many children does Zlatan have?", answer1: "0", answer2: "1", answer3: "2", answer4: "3", correctAnswer: "2"),
        QuestionSetUp(question: "Who is the best player?", answer1: "Zlatan", answer2: "Ronaldo", answer3: "Messi", answer4: "Markus", correctAnswer: "Markus")
    ]
}















