//
//  SurveyContentViewController.swift
//  SpartanSurvey
//
//  Created by Yonas on 4/27/18.
//  Copyright © 2018 SJSU. All rights reserved.
//

import UIKit

class SurveyContentViewController: UITableViewController{
    

    var survey = SurveyContent()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        survey.title = "survey1"
        
        self.tableView.isScrollEnabled = true
        self.tableView.separatorColor = UIColor.brown
    
        let codedLabel:UILabel = UILabel()
        codedLabel.frame = self.surveyTitle.frame
        codedLabel.textAlignment = .center
        codedLabel.text = survey.title
        codedLabel.numberOfLines=1
        codedLabel.textColor=UIColor.white
        codedLabel.font=UIFont.systemFont(ofSize: 20)
        codedLabel.backgroundColor=UIColor.darkGray
        self.surveyTitle.addSubview(codedLabel)
        
        
        let q1 = Question(aQuestion: "First Question", choices: ["red", "blue", "white"],aQuestionType: "single selection", isAnswerRequired: false)
        let q2 = Question(aQuestion: "Second Question", choices: ["square", "circle", "triangle"],aQuestionType: "single selection", isAnswerRequired: false)
        let q3 = Question(aQuestion: "third Question", choices: ["white", "green", "white"],aQuestionType: "single selection", isAnswerRequired: false)
        let q4 = Question(aQuestion: "fourth Question", choices: ["round", "oval", "triangle"],aQuestionType: "single selection", isAnswerRequired: false)
        let q5 = Question(aQuestion: "fifth Question", choices: ["apple", "banana", "orange"],aQuestionType: "single selection", isAnswerRequired: false)
        let q6 = Question(aQuestion: "sixth Question", choices: ["toyota", "nissan", "ferrarri"],aQuestionType: "single selection", isAnswerRequired: false)
        
        survey.questions.append(q1)
        survey.questions.append(q2)
        survey.questions.append(q3)
        survey.questions.append(q4)
        survey.questions.append(q5)
        survey.questions.append(q6)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return survey.questions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return survey.questions[section].answers.count
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return survey.questions[section].question
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        // Configure the cell...

        cell.textLabel?.text = survey.questions[indexPath.section].answers[indexPath.row]
        cell.backgroundColor = UIColor.cyan
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
