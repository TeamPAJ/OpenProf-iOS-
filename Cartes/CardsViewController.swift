//
//  CardsViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 13/02/2021.
//

import UIKit
import CoreData

class CardsViewController: UIViewController, UITabBarControllerDelegate {
    //public var viewControl : ViewController
    @IBOutlet weak var gaillardCard : UIImageView!
    @IBOutlet weak var gogueyCard : UIImageView!
    @IBOutlet weak var maaroufCard : UIImageView!
    @IBOutlet weak var muridiCard : UIImageView!
    @IBOutlet weak var gogueyCardBis : UIImageView!
    @IBOutlet weak var salaunCard : UIImageView!
    @IBOutlet weak var pajCard : UIImageView!
    //Combos Cartes Outlet Labels
    @IBOutlet weak var gaillardNbLabel : UILabel!
    @IBOutlet weak var gogueyNbLabel : UILabel!
    @IBOutlet weak var muridiNbLabel : UILabel!
    @IBOutlet weak var maaroufNbLabel : UILabel!
    @IBOutlet weak var salaunNbLabel : UILabel!
    @IBOutlet weak var gogueyTotyNbLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLabelCombo()
        //self.salaunNbLabel.tintColor = UIColor.darkGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        let cardSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for r in results as! [NSManagedObject]{
                        if r.value(forKey: "gaillard") as? Bool == true{
                            self.gaillardCard.image = UIImage(named: "carte2.png")
                            if ((r.value(forKey: "nbgaillard") as? Int) != nil){
                                let nb = r.value(forKey: "nbgaillard") as! Int
                                let nombreGaillard = String(r.value(forKey: "nbgaillard") as! Int)
                                self.gaillardNbLabel.text = nombreGaillard
                                cardSave.setValue(nb, forKey: "nbgaillard")
                            }
                        }
                        if r.value(forKey: "goguey") as? Bool == true{
                            self.gogueyCard.image = UIImage(named: "carte5.png")
                            if ((r.value(forKey: "nbgoguey") as? Int) != nil){
                                let nb = r.value(forKey: "nbgoguey") as! Int
                                let nombreGoguey = String(r.value(forKey: "nbgoguey") as! Int)
                                self.gogueyNbLabel.text = nombreGoguey
                                cardSave.setValue(nb, forKey: "nbgoguey")
                            }
                        }
                        if r.value(forKey: "muridi") as? Bool == true{
                            self.muridiCard.image = UIImage(named: "carte6.png")
                            if ((r.value(forKey: "nbmuridi") as? Int) != nil){
                                let nb = r.value(forKey: "nbmuridi") as! Int
                                let nombreMuridi = String(r.value(forKey: "nbmuridi") as! Int)
                                self.muridiNbLabel.text = nombreMuridi
                                cardSave.setValue(nb, forKey: "nbmuridi")
                            }
                            
                        }
                        if r.value(forKey: "salaun") as? Bool == true{
                            self.salaunCard.image = UIImage(named: "carte1.png")
                            if ((r.value(forKey: "nbsalaun") as? Int) != nil){
                                let nb = r.value(forKey: "nbsalaun") as! Int
                                let nombreSalaun = String(r.value(forKey: "nbsalaun") as! Int)
                                self.salaunNbLabel.text = nombreSalaun
                                cardSave.setValue(nb, forKey: "nbsalaun")
                            }
                            
                        }
                        if r.value(forKey: "maarouf") as? Bool == true{
                            self.maaroufCard.image = UIImage(named: "carte0.png")
                            if ((r.value(forKey: "nbmaarouf") as? Int) != nil){
                                let nb = r.value(forKey: "nbmaarouf") as! Int
                                let nombreMaarouf = String(r.value(forKey: "nbmaarouf") as! Int)
                                self.maaroufNbLabel.text = nombreMaarouf
                                cardSave.setValue(nb, forKey: "nbmaarouf")
                            }
                            
                        }
                        if r.value(forKey: "gogueyToty") as? Bool == true{
                            self.gogueyCardBis.image = UIImage(named: "carte3.png")
                            if ((r.value(forKey: "nbgogueyToty") as? Int) != nil){
                                let nb = r.value(forKey: "nbgogueyToty") as! Int
                                let nombreGogueyToty = String(r.value(forKey: "nbgogueyToty") as! Int)
                                self.gogueyTotyNbLabel.text = nombreGogueyToty
                                cardSave.setValue(nb, forKey: "nbgogueyToty")
                            }
                            
                        }
                        
                    }
                }
            print()
            }catch{
                print("Objet Core Data introuvable")
            }
    }
    
    public func initLabelCombo(){
        if self.gaillardNbLabel.text == "Label" || self.gaillardNbLabel.text == "0"{
            self.gaillardNbLabel.text = ""
        }
        if self.gogueyNbLabel.text == "Label" || self.gogueyNbLabel.text == "0"{
            self.gogueyNbLabel.text = ""
        }
        if self.gogueyTotyNbLabel.text == "Label" || self.gogueyTotyNbLabel.text == "0"{
            self.gogueyTotyNbLabel.text = ""
        }
        if self.muridiNbLabel.text == "Label" || self.muridiNbLabel.text == "0"{
            self.muridiNbLabel.text = ""
        }
        if self.salaunNbLabel.text == "Label" || self.salaunNbLabel.text == "0"{
            self.salaunNbLabel.text = ""
        }
        if self.maaroufNbLabel.text == "Label" || self.maaroufNbLabel.text == "0"{
            self.maaroufNbLabel.text = ""
        }
    }
    
   
}




