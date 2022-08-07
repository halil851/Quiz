//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by halil dikişli on 5.08.2022.

//

import Foundation

struct Question {
    let text: String
    var answer: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        rightAnswer = correctAnswer
        
    }
}
