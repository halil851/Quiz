


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
   
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
        
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        sender.setTitleColor(UIColor .black, for: UIControl.State.normal)
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswer()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        choice1.setTitleColor(UIColor .white, for: UIControl.State.normal)
        choice2.setTitleColor(UIColor .white, for: UIControl.State.normal)
        choice3.setTitleColor(UIColor .white, for: UIControl.State.normal)
        if quizBrain.getScore() == 0 {
            lastScore.text = "Last Score: \(quizBrain.lastScoreQuiz)"
        }
    }
    
}

