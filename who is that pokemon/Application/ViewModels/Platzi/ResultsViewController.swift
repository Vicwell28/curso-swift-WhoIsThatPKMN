//
//  ResultsViewController.swift
//  who is that pokemon
//
//  Created by soliduSystem on 27/02/23.
//

import UIKit
import Kingfisher

class ResultsViewController: UIViewController {
    
    // MARK: - Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLifecycle("viewDidLoad()", for: self.description)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLifecycle("viewWillAppear()", for: self.description)
        
        self.lableScore.text = "Perdiste, tu puntaje fue de \(self.finalScore)"
        
        self.lablePokemon.text = "No, es un \(self.txtlablePokemon)"
        
        self.imgViewPokemon.kf.setImage(with: URL(string: self.txtimagePokemon)!)
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
    
    @IBOutlet weak var imgViewPokemon: UIImageView!
    @IBOutlet weak var lableScore: UILabel!
    @IBOutlet weak var lablePokemon: UILabel!
    // MARK: - Public let / var
    public var txtimagePokemon : String = ""
    public var finalScore : Int = 0
    public var txtlablePokemon : String = ""
    
    
    // MARK: - Private let / var
    
    
    // MARK: - IBAction
    
    @IBAction func TouchUpReloadGame(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}



// MARK: - Public Func
extension ResultsViewController {
    
}

// MARK: - Private Func
extension ResultsViewController {

}

// MARK: - Services
extension ResultsViewController {
    
}

// MARK: - Other
extension ResultsViewController {
    
}
