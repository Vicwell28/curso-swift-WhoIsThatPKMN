//
//  ViewController.swift
//  who is that pokemon
//
//  Created by Alex Camacho on 01/08/22.
//

import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLifecycle("viewDidLoad()", for: self.description)
        self.pokemonManager.delegate = self
        self.pokemonImageManager.delegate = self
        self.labelMessage.text = " "
        pokemonManager.fetchPokemon()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLifecycle("viewWillAppear()", for: self.description)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLifecycle("viewDidAppear()", for: self.description)
        self.labelMessage.text = " "
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.showLifecycle("viewWillDisappear()", for: self.description)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.showLifecycle("viewDidDisappear()", for: self.description)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultsViewController = segue.destination as! ResultsViewController
            
            print("SE VA : \(self.imageData) ,  \(self.countCorrectAnswers) , \(self.correctAnswer)")
            
            resultsViewController.txtimagePokemon = self.imageData
            resultsViewController.finalScore = self.countCorrectAnswers
            resultsViewController.txtlablePokemon = self.correctAnswer
        }
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

// MARK: - IBAction

}



// MARK: - Public Func
extension PokemonViewController {
    
}

// MARK: - Private Func
extension PokemonViewController {
    
    private func reloadGame(_ sender : UIButton) -> Void {
        sender.borderWidth = 0
        self.labelMessage.text = " "
        self.lableScore.text = "Puntaje \(self.countCorrectAnswers)"
        self.answersButtons.forEach({$0.isEnabled = true})
        self.pokemonManager.fetchPokemon()
        
    }
    
}
extension PokemonViewController : ImageMangerDelegate {
    func didResponseImagePokemon(pokemonImage: ImageModel?, error: Error?) {
        if error != nil {
            return
        }
        
        DispatchQueue.main.async {
            self.imageData =  pokemonImage!.imgaeURL
            
            self.pokemonImage.kf.setImage(with: URL(string: pokemonImage!.imgaeURL)!, options: [
                .processor(ColorControlsProcessor(brightness: -1, contrast: 1, saturation: 1, inputEV: 0))
            ])
        }
        
        
    }
}
// MARK: - Services
extension PokemonViewController : PokemonManagerDelegate{
    
    func didUpdatePokemon(pokemon: [pokemonModel]) {
        
        let  pok = pokemon.shuffled().prefix(4)
        
        let index = Int.random(in: 0...3)
        
        let imageDataS = pok[index].imageURL
        
        self.pokemonImageManager.fetchRequest(with: imageDataS)
        
        self.correctAnswer = pok[index].name
        
        print("ESTE ES EL BUENO : \(self.correctAnswer)")
        
        for (index, button) in answersButtons.enumerated() {
            DispatchQueue.main.async {
                button.tag = index
                button.setTitle(pok[index].name.capitalized, for: .normal)
            }
        }
    }
    
    func didFailWithError(error: Error) {
        print("didFailWithError")
        print(error)
    }
    
}

// MARK: - Other
extension PokemonViewController {
    
}
