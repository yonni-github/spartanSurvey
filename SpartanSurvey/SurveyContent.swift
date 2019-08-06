//
//  SurveyContent.swift
//  SpartanSurvey
//
//  Created by Yonas on 4/27/18.
//  Copyright © 2018 SJSU. All rights reserved.
//

import Foundation

struct SurveyContent{
    var title: String
    var surveyType: String = ""
    var questions: [Question] = []
    
    init() {
        title = ""
    }

}

public struct Question {
    var question: String = ""
    var answers: [String] = []
    var questionType:String = ""
    var answerRequired: Bool = true
    
    init(aQuestion: String, choices: [String],aQuestionType: String, isAnswerRequired: Bool) {
    
        question = aQuestion
        answers = choices
        questionType = aQuestionType
        answerRequired = isAnswerRequired
    }
    
}
