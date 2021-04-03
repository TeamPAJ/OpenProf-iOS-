//
//  ViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 12/02/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    // Variables et outlets
    @IBOutlet weak var circle : UIImageView!
    @IBOutlet weak var carteObtenue : UIImageView!
    @IBOutlet weak var ArgentJoueur : UILabel?
    @IBOutlet weak var caisseBouton : UIButton!
    @IBOutlet weak var obtenirCarte : UIButton!
    @IBOutlet weak var pseudo : UILabel!
    //@IBOutlet weak var chargementBouton : UIActivityIndicatorView!
    
    public var gaillardObtenu : Bool!
    public var maaroufObtenu : Bool!
    public var gogueyObtenu : Bool!
    public var pajObtenu : Bool!
    public var salaunObtenu : Bool!
    public var muridiObtenu : Bool!
    public var gogueyToty : Bool!
    public var moneyStatue : Int!
    public var carteActuelleStockee : String!
    
    public var numberGaillard : Int?
    public var numberGoguey : Int?
    public var numberMuridi : Int?
    public var numberMaarouf : Int?
    public var numberSalaun : Int?
    public var numberGogueyToty : Int?
    // Base
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.ArgentJoueur?.textColor = UIColor.darkGray
        self.pseudo?.textColor = UIColor.darkGray
        //self.linkPseudo()
        //self.easterEgg1()
        //self.chargementBouton.isHidden = true
        //Core data base var
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        //let comboSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for r in results as! [NSManagedObject]{
                        self.numberGaillard = r.value(forKey: "nbgaillard") as? Int
                        self.numberGoguey = r.value(forKey: "nbgoguey") as? Int
                        self.numberMaarouf = r.value(forKey: "nbmaarouf") as? Int
                        self.numberSalaun = r.value(forKey: "nbsalaun") as? Int
                        self.numberGogueyToty = r.value(forKey: "nbgogueyToty") as? Int
                        self.numberMuridi = r.value(forKey: "nbmuridi") as? Int
                        try context.save()
                    }
                } else {
                    self.numberGaillard = 0
                    self.numberGoguey = 0
                    self.numberMuridi = 0
                    self.numberMaarouf = 0
                    self.numberSalaun = 0
                    self.numberGogueyToty = 0
                }
        } catch {
            print("erreur init cartes")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.easterEgg1()
        self.linkPseudo()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //let cardSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //let comboSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        //let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            //let results2 = try context.fetch(request2)
            if let user = results.first as? NSManagedObject {
                if let money = user.value(forKey: "money") as? Int {
                    self.ArgentJoueur?.text = String(money)
                }
            }
            try context.save()
        }catch{
            print("Error Core Data")
        }

        self.verifArgent()
        
    }
    
    // evenement clique bouton caisse
    @IBAction func buttonTapped(_ sender: UIButton) {
        //Init nombre cartes combos --> Core Data
        if self.obtenirCarte.title(for: .normal) == "Obtenue" || self.obtenirCarte.title(for: .normal) == ""{
            self.obtenirCarte.setTitle("Obtenir", for: .normal)
            self.obtenirCarte.isEnabled = true
        }
        self.obtenirCarte.isHidden = false
        let x = randomNumber(probabilities: [0.8,0.1,0.05,0.008,0.002])
        let argentString : String? = self.ArgentJoueur?.text
        var argentUser = Int(argentString!)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        argentUser = argentUser! - 2
        self.ArgentJoueur?.text = String(argentUser ?? 0)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        request.returnsObjectsAsFaults = false
        //request2.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if let user = results.first as? NSManagedObject {
                user.setValue(argentUser, forKey: "money")
                try context.save()
            } else {
                let moneySave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                moneySave.setValue(argentUser, forKey: "money")
                try context.save()
            }
        }catch{
            print("Objet Core Data introuvable")
            let moneySave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            moneySave.setValue(argentUser, forKey: "money")
            //            try context.save()
        }
        
        
        switch x {
        case 0:
            self.carteObtenue.image = UIImage(named:"carte3.png")
            
            self.carteActuelleStockee = "gaillard"
            if(argentUser != 0){
                self.gaillardObtenu = true;
                
            }
            if((argentUser)! < 1){
                self.ArgentJoueur?.text = "0"
                self.carteObtenue.image = UIImage(named:"error.png")
                self.ArgentJoueur?.textColor = UIColor.red
                self.obtenirCarte.isHidden = true
                self.obtenirCarte.setTitle("Boutique", for: .normal)
            }
            break
        case 1:
            let y = randomNumber(probabilities: [0.5,0.5])
            switch y {
            case 0:
                self.carteObtenue.image = UIImage(named:"carte6bis.png")
                self.carteActuelleStockee = "goguey"
                if(argentUser != 0){
                    self.gogueyObtenu = true
                    
                }
                if((argentUser)! < 1){
                    self.ArgentJoueur?.text = "0"
                    self.carteObtenue.image = UIImage(named:"error.png")
                    self.ArgentJoueur?.textColor = UIColor.red
                    //self.obtenirCarte.isHidden = true
                    self.obtenirCarte.setTitle("Boutique", for: .normal)
                }
            case 1:
                self.carteObtenue.image = UIImage(named:"carte7.png")
                self.carteActuelleStockee = "muridi"
                if(argentUser != 0){
                    self.muridiObtenu = true
                    
                }
                if((argentUser)! < 1){
                    self.ArgentJoueur?.text = "0"
                    self.carteObtenue.image = UIImage(named:"error.png")
                    self.ArgentJoueur?.textColor = UIColor.red
                    //self.obtenirCarte.isHidden = true
                    self.obtenirCarte.setTitle("Boutique", for: .normal)
                }
            default:
                print("Aucune carte obtenue...")
            }
            
            break
        case 2:
            let z = randomNumber(probabilities: [0.6,0.4])
            switch z {
            case 0:
                self.carteObtenue.image = UIImage(named:"carte.png")
                self.carteActuelleStockee = "maarouf"
                if(argentUser != 0){
                    self.ArgentJoueur?.text = String(argentUser ?? 0)
                    self.maaroufObtenu = true
                    
                }
                if((argentUser)! < 1){
                    self.ArgentJoueur?.text = "0"
                    self.carteObtenue.image = UIImage(named:"error.png")
                    self.ArgentJoueur?.textColor = UIColor.red
                    //self.obtenirCarte.isHidden = true
                    self.obtenirCarte.setTitle("Boutique", for: .normal)
                }
                break
            case 1:
                self.carteObtenue.image = UIImage(named:"carte2.png")
                self.carteActuelleStockee = "salaun"
                if(argentUser != 0){
                    self.ArgentJoueur?.text = String(argentUser ?? 0)
                    self.salaunObtenu = true
                    
                }
                if((argentUser)! < 1){
                    self.ArgentJoueur?.text = "0"
                    self.carteObtenue.image = UIImage(named:"error.png")
                    self.ArgentJoueur?.textColor = UIColor.red
                    //self.obtenirCarte.isHidden = true
                    self.obtenirCarte.setTitle("Boutique", for: .normal)
                }
                break
            default: break
                
            }
        case 3:
            self.carteObtenue.image = UIImage(named:"carte6.png")
            self.carteActuelleStockee = "gogueyToty"
            if(argentUser != 0){
                self.gogueyToty = true
                
            }
            if((argentUser)! < 1){
                self.ArgentJoueur?.text = "0"
                self.carteObtenue.image = UIImage(named:"error.png")
                self.ArgentJoueur?.textColor = UIColor.red
                //self.obtenirCarte.isHidden = true
                self.obtenirCarte.setTitle("Boutique", for: .normal)
            }
            break
        case 4:
            self.carteObtenue.image = UIImage(named:"secret-card.png")
            self.carteActuelleStockee = "paj"
            if(argentUser != 0){
                self.pajObtenu = true
            }
            if((argentUser)! < 1){
                self.ArgentJoueur?.text = "0"
                self.carteObtenue.image = UIImage(named:"money.png")
                self.ArgentJoueur?.textColor = UIColor.red
                //self.obtenirCarte.isHidden = true
                self.obtenirCarte.setTitle("Boutique", for: .normal)
            }
            break
        default:
            self.carteObtenue.image = UIImage(named:"error.png")
        }
    }
    
    // fonction de tirage loi binomiale
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
    
    @IBAction func getCarte(_ sender: UIButton){
        //print("Carte obtenue ! ")
        self.obtenirCarte.isHidden = true
        //self.chargementBouton.startAnimating()
        //self.perform(#selector(ViewController.RefineButtonPress), with: nil, afterDelay: 3.0)
        if(self.obtenirCarte.title(for: .normal) == "Boutique"){
            self.obtenirCarte.isHidden = false
            //print("Aller à la boutique")
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let cardSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        let comboRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        do{
            try context.save()
            if(self.carteActuelleStockee == "gaillard"){
                self.numberGaillard! += 1
                let resultsGaillard = try context.fetch(comboRequest)
                if(resultsGaillard.count > 0){
                    for nbGaillard in resultsGaillard as! [NSManagedObject]{
                        if ((nbGaillard.value(forKey: "nbgaillard") as? Int)!) >= 0{
                            // compteur ok
                            nbGaillard.setValue(self.numberGaillard, forKey: "nbgaillard")
                            cardSave.setValue(nbGaillard.value(forKey: "nbgaillard") as? Int, forKey: "nbgaillard")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberGaillard, forKey: "nbgaillard")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.gaillardObtenu, forKey: self.carteActuelleStockee)
                try context.save()
                //print(cardSave.value(forKey: "nbgaillard") as! Int)
            }
            if(self.carteActuelleStockee == "goguey"){
                self.numberGoguey! += 1
                let resultsGoguey = try context.fetch(comboRequest)
                if(resultsGoguey.count > 0){
                    for nbGoguey in resultsGoguey as! [NSManagedObject]{
                        if ((nbGoguey.value(forKey: "nbgoguey") as? Int)!) >= 0{
                            // compteur ok
                            nbGoguey.setValue(self.numberGoguey, forKey: "nbgoguey")
                            cardSave.setValue(self.numberGoguey, forKey: "nbgoguey")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberGoguey, forKey: "nbgoguey")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.gogueyObtenu, forKey: self.carteActuelleStockee)
                try context.save()
                //print(cardSave.value(forKey: "nbgoguey") as! Int)
            }
            if(self.carteActuelleStockee == "maarouf"){
                self.numberMaarouf! += 1
                let resultsMaarouf = try context.fetch(comboRequest)
                if(resultsMaarouf.count > 0){
                    for nbMaarouf in resultsMaarouf as! [NSManagedObject]{
                        if ((nbMaarouf.value(forKey: "nbmaarouf") as? Int)!) >= 0{
                            // compteur ok
                            nbMaarouf.setValue(self.numberMaarouf, forKey: "nbmaarouf")
                            cardSave.setValue(self.numberMaarouf, forKey: "nbmaarouf")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberMaarouf, forKey: "nbmaarouf")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.maaroufObtenu, forKey: self.carteActuelleStockee)
                try context.save()
                //print(cardSave.value(forKey: "nbmaarouf") as! Int)
            }
            if(self.carteActuelleStockee == "gogueyToty"){
                self.numberGogueyToty! += 1
                let resultsGogueyToty = try context.fetch(comboRequest)
                if(resultsGogueyToty.count > 0){
                    for nbGogueyToty in resultsGogueyToty as! [NSManagedObject]{
                        if ((nbGogueyToty.value(forKey: "nbgogueyToty") as? Int)!) >= 0{
                            // compteur ok
                            nbGogueyToty.setValue(self.numberGogueyToty, forKey: "nbgogueyToty")
                            cardSave.setValue(self.numberGogueyToty, forKey: "nbgogueyToty")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberGogueyToty, forKey: "nbgogueyToty")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.gogueyToty, forKey: self.carteActuelleStockee)
                try context.save()
                print(cardSave.value(forKey: "nbgogueyToty") as! Int)
            }
            if(self.carteActuelleStockee == "paj"){
                cardSave.setValue(self.pajObtenu, forKey: self.carteActuelleStockee)
            }
            if(self.carteActuelleStockee == "muridi"){
                self.numberMuridi! += 1
                let resultsMuridi = try context.fetch(comboRequest)
                if(resultsMuridi.count > 0){
                    for nbMuridi in resultsMuridi as! [NSManagedObject]{
                        if ((nbMuridi.value(forKey: "nbmuridi") as? Int)!) >= 0{
                            // compteur ok
                            nbMuridi.setValue(self.numberMuridi, forKey: "nbmuridi")
                            cardSave.setValue(self.numberMuridi, forKey: "nbmuridi")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberMuridi, forKey: "nbgaillard")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.muridiObtenu, forKey: self.carteActuelleStockee)
                try context.save()
                print(cardSave.value(forKey: "nbmuridi") as! Int)
            }
            if(self.carteActuelleStockee == "salaun"){
                self.numberSalaun! += 1
                let resultsSalaun = try context.fetch(comboRequest)
                if(resultsSalaun.count > 0){
                    for nbSalaun in resultsSalaun as! [NSManagedObject]{
                        if ((nbSalaun.value(forKey: "nbsalaun") as? Int)!) >= 0{
                            // compteur ok
                            nbSalaun.setValue(self.numberSalaun, forKey: "nbsalaun")
                            cardSave.setValue(self.numberSalaun, forKey: "nbsalaun")
                            try context.save()
                        }
                    }
                    //print("Gaillard : ")
                    ///try context.save()
                    //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                } else {
                    cardSave.setValue(self.numberSalaun, forKey: "nbgaillard")
                    ///try context.save()
                }
                //self.numberGaillard = cardSave.value(forKey: "nbgaillard") as? Int
                cardSave.setValue(self.salaunObtenu, forKey: self.carteActuelleStockee)
                try context.save()
                print(cardSave.value(forKey: "nbsalaun") as! Int)
            }
        }catch{
            print("erreur")
        }
        
    }
    
    public func verifArgent(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if let user = results.first as? NSManagedObject {
                if let money = user.value(forKey: "money") as? Int {
                    if(money <= 0){
                        self.ArgentJoueur?.textColor = UIColor.red
                        self.obtenirCarte.setTitle("Boutique", for: .normal)
                    }
                    if(money > 0){
                        self.ArgentJoueur?.textColor = UIColor.darkGray
                        self.obtenirCarte.setTitle("Obtenir", for: .normal)
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
        
    }
    
    // Fonction qui récupére le pseudo et l'affiche sur la vue principale
    public func linkPseudo(){
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
                        self.pseudo.text = r.value(forKey: "pseudo") as? String
                        print(r.value(forKey: "pseudo") as! String)
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
    }
    
    //@objc public func RefineButtonPress() {
        //self.chargementBouton.stopAnimating()
        //self.chargementBouton.isHidden = true
    //}
    
    @objc public func RefineButtonText() {
        self.obtenirCarte.setTitle("Obtenue", for: .normal)
        self.obtenirCarte.isHidden = true
    }
    
    public func easterEgg1(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        
        
        ///let pseudoEgg = pseudoSave.value(forKey: "pseudoEntree") as? Bool
        ///let pseudoUserEgg = pseudoSave.value(forKey: "pseudo") as? String
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                if let r = results.first as? NSManagedObject{
                    if (r.value(forKey: "nbgaillard") as! Int > 0) && (r.value(forKey: "nbmuridi") as! Int) > 0 && (r.value(forKey: "nbmaarouf") as! Int) > 0 && (r.value(forKey: "nbgoguey") as! Int) > 0 && (r.value(forKey: "nbsalaun") as! Int) > 0 && (r.value(forKey: "nbgogueyToty") as! Int) > 0{
                        print("ok")
                        let easterSaveOK = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                        //pseudoSave.setValue(true, forKey: "easterEggActivate1")
                        //if easterSaveOK.value(forKey: "easterEggActivate1") as? Bool == nil {
                            easterSaveOK.setValue(true, forKey: "easterEggActivate1")
                            try context.save()
                        //}
                        
                    } else {
                        let easterSaveNOK = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                        //pseudoSave.setValue(false, forKey: "easterEggActivate1")
                        //if easterSaveNOK.value(forKey: "easterEggActivate1") as? Bool == nil {
                            easterSaveNOK.setValue(false, forKey: "easterEggActivate1")
                            try context.save()
                        //}
                    }
                    
                }
            }
            
        } catch{
            print("erreur inconnue")
        }
    }
}

