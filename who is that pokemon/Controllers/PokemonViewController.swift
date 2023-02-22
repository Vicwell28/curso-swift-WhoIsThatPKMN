//
//  ViewController.swift
//  who is that pokemon
//
//  Created by Alex Camacho on 01/08/22.
//

import UIKit

class PokemonViewController: UIViewController {

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
    
    
    // MARK: - Private let / var
    
    
    // MARK: - IBAction
    
}



// MARK: - Public Func
extension PokemonViewController {
    
}

// MARK: - Private Func
extension PokemonViewController {
    
}

// MARK: - Services
extension PokemonViewController {
    
}

// MARK: - Other
extension PokemonViewController {
    
}
