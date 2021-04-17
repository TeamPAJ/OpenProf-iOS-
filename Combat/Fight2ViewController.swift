//
//  FightViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 06/04/2021.
//

import UIKit
import CoreData

class Fight2ViewController: UIViewController {
    
    var timer: Timer?
    var victoryOrDefeat : String?
    var winXP : Int!
    
    @IBOutlet weak var lifeUser : UIProgressView!
    @IBOutlet weak var lifeEnemy : UIProgressView!
    @IBOutlet weak var pseudoUser : UILabel!
    @IBOutlet weak var cardToWin : UIButton!
    @IBOutlet weak var cardUser : UIImageView!
    
    public var currentLifeEnemyCard : Float!
    
    public var userSyncTableData: (name: String, life: Double, attack: Double, image: String)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentLifeEnemyCard = 1.0
        self.lifeUser.progress = 1.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initPseudoUser()
        self.attackReceiveByInstructor()
        self.cardUser.image = UIImage(named: userSyncTableData.image)
        self.currentLifeEnemyCard = 1.0
        self.lifeUser.progress = 1.0
    }
    
    // Attaque de l'utilisateur
    @IBAction func attack(_ sender: UIButton!){
        if self.currentLifeEnemyCard <= 0.0 {
            // alert vie enemy à 0 --> vaincu
        }
        else {
            let damageRand = self.randomNumber(probabilities: [0.8, 0.1, 0.08, 0.02])
            switch damageRand {
            case 0:
                let damage = self.userSyncTableData.attack
                self.lifeEnemy.setProgress(currentLifeEnemyCard - Float(damage), animated: true)
                if self.lifeEnemy.progress <= 0.0{
                    self.blockToMin()
                    self.endGame()
                } else {
                    self.currentLifeEnemyCard = self.currentLifeEnemyCard - Float(damage)
                }
                break
            case 1:
                let damage = self.userSyncTableData.attack * 1.3
                self.lifeEnemy.setProgress(currentLifeEnemyCard - Float(damage), animated: true)
                if self.lifeEnemy.progress <= 0.0{
                    self.blockToMin()
                    self.endGame()
                } else {
                    self.currentLifeEnemyCard = self.currentLifeEnemyCard - Float(damage)
                }
                break
            case 2:
                let damage = self.userSyncTableData.attack * 1.6
                self.lifeEnemy.setProgress(currentLifeEnemyCard - Float(damage), animated: true)
                if self.lifeEnemy.progress <= 0.0{
                    self.blockToMin()
                    self.endGame()
                } else {
                    self.currentLifeEnemyCard = self.currentLifeEnemyCard - Float(damage)
                }
                break
            case 3:
                let damage = self.userSyncTableData.attack * 2.0
                self.lifeEnemy.setProgress(currentLifeEnemyCard - Float(damage), animated: true)
                if self.lifeEnemy.progress <= 0.0{
                    self.blockToMin()
                    self.endGame()
                } else {
                    self.currentLifeEnemyCard = self.currentLifeEnemyCard - Float(damage)
                }
                break
            default:
                print("erreur")
            }
        }
    }
    
    private func blockToMin(){
        self.lifeEnemy.progress = 0.0
    }
    // Sync de la vie de la carte adverse
    private func saveLifeEnemy(){
        self.lifeUser.setProgress(currentLifeEnemyCard, animated: true)
    }
    
    // Fin de la partie
    private func endGame(){
        ///self.saveLifeEnemy()
        if self.lifeUser.progress > self.lifeEnemy.progress{
            self.victoryOrDefeat = "Victoire"
            self.winXP = 800
        }
        else if self.lifeUser.progress < self.lifeEnemy.progress{
            self.victoryOrDefeat = "Défaite"
            self.winXP = 0
        } else {
            self.victoryOrDefeat = "Égalité"
        }
        self.lifeEnemy.progress = 1.0
        self.lifeUser.progress = 1.0
        self.winOrNotCardLevel()
        self.alertEndGame()
    }
    
    func alertEndGame(){
        let alert = UIAlertController(title: self.victoryOrDefeat, message: "Fin de la partie ! Gain " + String(winXP), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "S'en aller", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                let VC = self.storyboard?.instantiateViewController(withIdentifier: "levels") as! LevelsViewController //The file that controls the view
                //self.winOrNotCardLevel()
                self.present(VC, animated: true, completion: nil)
            //break ?
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                print("erreur")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    public func randomNumber(probabilities: [Double]) -> Int {
        
        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, +)
        // Nombre aléatoire tel que :  0.0 <= rnd < sum :
        let rnd = Double.random(in: 0.0 ..< sum)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return i
            }
        }
        // This point might be reached due to floating point inaccuracies:
        return (probabilities.count - 1)
    }
    
    
    // Récupération du pseudo de l'utilisateur dans le Core Data
    public func initPseudoUser(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                if let r = results.first as? NSManagedObject{
                    if r.value(forKey: "pseudoEntree") as? Bool == true{
                        ///let userPseudo = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                        self.pseudoUser.text = r.value(forKey: "pseudo") as? String
                        //print(r.value(forKey: "pseudo") as! String)
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
    }
    
    public func attackReceiveByInstructor(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { timer in
            
            
            let change: Float = Float(0.03/self.userSyncTableData.life)
            self.lifeUser.progress = self.lifeUser.progress - (change)
            self.lifeUser.progressTintColor = UIColor.red
            self.lifeUser.progressTintColor = UIColor.white
            if (self.lifeUser.progress <= 0.0) || (self.lifeEnemy.progress <= 0.0){
                self.timer?.invalidate()
                self.endGame()
            }
        })
    }
    
    public func winOrNotCardLevel(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Fights")
        let cardWinSave2 = NSEntityDescription.insertNewObject(forEntityName: "Fights", into: context)
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                for r in results as! [NSManagedObject]{
                    if self.victoryOrDefeat == "Victoire"{
                        ///let userPseudo = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                        //r.setValue(true, forKey: "lbathWin")
                        //cardWinSave.setValue(true, forKey: "lbathWin")
                        //try context.save()
                        cardWinSave2.setValue(true, forKey: "level2Validate")
                        try context.save()
                        cardWinSave2.setValue(true, forKey: "vlestidWin")
                        r.setValue(true, forKey: "vlestidWin")
                        try context.save()
                    }
                    if self.victoryOrDefeat == "Défaite"{
                        //r.setValue(false, forKey: "lbathWin")
                        //cardWinSave.setValue(false, forKey: "lbathWin")
                        //try context.save()
                        cardWinSave2.setValue(false, forKey: "level2Validate")
                        try context.save()
                        cardWinSave2.setValue(false, forKey: "vlestidWin")
                        r.setValue(false, forKey: "vlestidWin")
                        try context.save()
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
    }
}
