//
//  ProfilViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 20/03/2021.
//

import UIKit
import CoreData

class ProfilViewController: UIViewController{
    
    @IBOutlet weak var nivMin : UILabel!
    @IBOutlet weak var nivMax : UILabel!
    @IBOutlet weak var niveauProgression : UIProgressView!
    
    @IBOutlet weak var trophy1Available : UIImageView!
    @IBOutlet weak var trophy2Available : UIImageView!
    @IBOutlet weak var trophy3Available : UIImageView!
    
    public var xpCommune : Int!
    public var xpRare : Int!
    public var xpEpic : Int!
    public var xpLegendaire : Int!
    public var xpUser : Int!
    
    public var niveau1Max : Int!
    public var niveau2Max : Int!
    public var niveau3Max : Int!
    public var niveau4Max : Int!
    public var niveau5Max : Int!
    public var niveau6Max : Int!
    public var niveau7Max : Int!
    
    @IBOutlet weak var pseudoUserActual : UILabel!    
    @IBOutlet weak var infoButton : UIButton!
    
    public var totalXP : Float!
    //@IBOutlet weak var pseudoProfil : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.xpCommune = Int(0.05);
        self.xpRare = Int(0.1);
        self.xpEpic = Int(0.3);
        self.xpLegendaire = Int(0.5);
        
        self.nivMin.text = "nv.MAX"
        self.nivMax.text = ""
        self.niveauProgression.progress = 1.0
        
        self.PickAndPrintPseudoActual()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Code
        //self.pseudoInit()
        self.xpSystemUser()
        self.syncInfoLink(activated: true)
        self.syncTrophy()
    }
    
    public func xpSystemUser(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        //let numberCards = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        
        
        
        //let xpActuel = xpCommuneActuel + xpRareActuel + xpEpicActuel + xpLegendaireActuel
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                if let r = results.first as? NSManagedObject{
                    //print("xp commun : ")
                    //print( ((Float(r.value(forKey: "nbgaillard") as! Int) * 0.05) / 10) + (((Float(r.value(forKey: "nbgoguey") as! Int) + Float(r.value(forKey: "nbmuridi") as! Int)) * 0.1) / 10) + (((Float(r.value(forKey: "nbsalaun") as! Int) + Float(r.value(forKey: "nbmaarouf") as! Int)) * 0.3) / 10) + ((Float(r.value(forKey: "nbgogueyToty") as! Int) * 0.5) / 10))
                    
                    
                    ///let xpRareActuel =  ((r.value(forKey: "nbgoguey") as! Int) + (r.value(forKey: "nbmuridi") as! Int))
                    //print("xp rare : ")
                    //print(xpRareActuel)
                    let _ = ((r.value(forKey: "nbsalaun") as! Int) + (r.value(forKey: "nbmaarouf") as! Int))
                    //print("xp epic : ")
                    //print(xpEpicActuel)
                    let _ = ((r.value(forKey: "nbgogueyToty") as! Int))
                    //print("xp leg : ")
                    //print(xpLegendaireActuel)
                    
                    self.totalXP = ((Float(r.value(forKey: "nbgaillard") as! Int) * 0.005)) + (((Float(r.value(forKey: "nbgoguey") as! Int) + Float(r.value(forKey: "nbmuridi") as! Int)) * 0.01)) + (((Float(r.value(forKey: "nbsalaun") as! Int) + Float(r.value(forKey: "nbmaarouf") as! Int)) * 0.03) ) + ((Float(r.value(forKey: "nbgogueyToty") as! Int) * 0.05))
                    
                    //print("Total XP du joueur : ")
                    //print(totalXP)
                    
                    if totalXP >= 0.0 && totalXP <= 1.0{
                        if totalXP >= 0.0 && totalXP < 0.10{
                            self.xpUser = 1
                            self.niveauProgression.progress = totalXP/0.1
                            self.nivMin.text = "nv.1"
                            self.nivMax.text = "nv.2"
                        }
                        else if totalXP >= 0.1 && totalXP < 0.2{
                            self.xpUser = 2
                            self.niveauProgression.progress = (totalXP/0.2)/2.0
                            self.nivMin.text = "nv.2"
                            self.nivMax.text = "nv.3"
                        }
                        else if totalXP >= 0.2 && totalXP < 0.3{
                            self.xpUser = 3
                            self.niveauProgression.progress = (totalXP/0.3)/2.0
                            self.nivMin.text = "nv.3"
                            self.nivMax.text = "nv.4"
                        }
                        else if totalXP >= 0.3 && totalXP < 0.5{
                            self.xpUser = 4
                            self.niveauProgression.progress = (totalXP/0.5)/2.0
                            print(0.02/(totalXP-0.03))
                            self.nivMin.text = "nv.4"
                            self.nivMax.text = "nv.5"
                        }
                        else if totalXP >= 0.5 && totalXP < 0.75{
                            self.xpUser = 5
                            self.niveauProgression.progress = (totalXP/0.75)/2.0
                            self.nivMin.text = "nv.5"
                            self.nivMax.text = "nv.6"
                        }
                        else if totalXP >= 0.75 && totalXP < 1.0{
                            self.xpUser = 6
                            self.niveauProgression.progress = (totalXP/1.0)/2.0
                            self.nivMin.text = "nv.6"
                            self.nivMax.text = "nv.MAX"
                        }
                        else {
                            self.xpUser = 7
                            self.niveauProgression.progress = 1.0
                            self.nivMin.text = "nv.6"
                            self.nivMax.text = "nv.MAX"
                        }
                    }
                }
            }
        }catch{
            print("erreur niveau config")
        }
        
        //print(numberCards.value(forKey: "nbgaillard") as! Int)
        
        
        
    }
    
    public func PickAndPrintPseudoActual(){
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
                        self.pseudoUserActual.text = r.value(forKey: "pseudo") as? String
                        //print(r.value(forKey: "pseudo") as! String)
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
    }
    
    public func syncInfoLink(activated: Bool){
        if activated == true{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
            _ = NSEntityDescription.insertNewObject(forEntityName: "Settings", into: context)
            request.returnsObjectsAsFaults = false
            do{
                let settings = try context.fetch(request)
                if(settings.count > 0){
                    if let link = settings.first as? NSManagedObject{
                        if link.value(forKey: "externalLinks") as? Bool == false{
                            self.infoButton.isHidden = true
                        }
                        else {
                            self.infoButton.isHidden = false
                        }
                    }
                }
            }catch{
                print("erreur lors de la synchronisation des paramètres")
            }
        }
    }
    
    private func syncTrophy(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Fights")
        _ = NSEntityDescription.insertNewObject(forEntityName: "Fights", into: context)
        request.returnsObjectsAsFaults = false
        do{
            let settings = try context.fetch(request)
            if(settings.count > 0){
                for trophy in settings as! [NSManagedObject]{
                    if trophy.value(forKey: "level1Validate") as? Bool == true{
                        self.trophy1Available.image = UIImage(named: "ok")
                    }

                }
            }
        }catch{
            print("erreur")
        }
    }
}
