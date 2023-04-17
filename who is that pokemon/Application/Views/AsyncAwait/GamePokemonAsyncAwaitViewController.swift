//
//  GamePokemonAsyncAwaitViewController.swift
//  who is that pokemon
//
//  Created by soliduSystem on 17/04/23.
//

import UIKit

class GamePokemonAsyncAwaitViewController: UIViewController {
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLifecycle("viewDidLoad()", for: self.description)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLifecycle("viewWillAppear()", for: self.description)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLifecycle("viewDidAppear()", for: self.description)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.showLifecycle("viewWillDisappear()", for: self.description)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.showLifecycle("viewDidDisappear()", for: self.description)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var pokemonImage : UIImageView!
    @IBOutlet weak var lableScore : UILabel!
    @IBOutlet weak var labelMessage : UILabel!
    @IBOutlet var answersButtons : [UIButton]!
    
    // MARK: - Public let / var
    lazy var pokemonManager = PokemonManager()
    lazy var pokemonImageManager = ImageManager()
    
    private var correctAnswer : String = ""
    private var correctAnswersImage : String = ""
    private var countCorrectAnswers : Int = 0
    private var imageData : String = ""
    
    
    // MARK: - Private let / var
    
    
    // MARK: - IBAction
    @IBAction func touchUpInside(_ sender: UIButton) {
        
        self.answersButtons.forEach({$0.isEnabled = false})
        
        if self.correctAnswer.lowercased().elementsEqual(self.answersButtons[sender.tag].titleLabel!.text!.lowercased()) {
            self.answersButtons[sender.tag].layer.borderColor = UIColor.green.cgColor
            self.answersButtons[sender.tag].layer.borderWidth = 2
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { Timer in
                self.countCorrectAnswers += 1
                self.reloadGame(sender)
            }
            
        } else {
            self.answersButtons[sender.tag].layer.borderColor = UIColor.red.cgColor
            self.answersButtons[sender.tag].layer.borderWidth = 2
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { Timer in
                self.performSegue(withIdentifier: "goToResults", sender: self)
                self.countCorrectAnswers = 0
                self.reloadGame(sender)
            }
        }
    }
}



// MARK: - Public Func
extension GamePokemonAsyncAwaitViewController {
    private func reloadGame(_ sender : UIButton) -> Void {
        sender.borderWidth = 0
        self.labelMessage.text = " "
        self.lableScore.text = "Puntaje \(self.countCorrectAnswers)"
        self.answersButtons.forEach({$0.isEnabled = true})
        self.pokemonManager.fetchPokemon()
        
    }
}

// MARK: - Private Func
extension GamePokemonAsyncAwaitViewController {
    
}

// MARK: - Services
extension GamePokemonAsyncAwaitViewController {
    
}

// MARK: - Other
extension GamePokemonAsyncAwaitViewController {
    
}
