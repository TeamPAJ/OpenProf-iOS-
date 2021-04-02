//
//  SaleViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 17/03/2021.
//

import UIKit
import CoreData

class SaleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    // Init Picker View --> pour init choix
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        
        self.moinsPlus.minimumValue = 0
        self.resetNombre()
        if self.pickerData[row] == "Gaillard"{
            // code
            self.imageRendu.image = UIImage(named: "carte3.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbgaillard")
            self.Rentability = 0.5
            self.SaveCard = "gaillard"
        }
        if self.pickerData[row] == "Goguey"{
            // code
            self.imageRendu.image = UIImage(named: "carte6bis.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbgoguey")
            self.Rentability = 1.0
            self.SaveCard = "goguey"
        }
        if self.pickerData[row] == "Muridi"{
            // code
            self.imageRendu.image = UIImage(named: "carte7.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbmuridi")
            self.Rentability = 1.0
            self.SaveCard = "muridi"
        }
        if self.pickerData[row] == "Salaun"{
            // code
            self.imageRendu.image = UIImage(named: "carte2.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbsalaun")
            self.Rentability = 2.5
            self.SaveCard = "salaun"
        }
        if self.pickerData[row] == "Maarouf"{
            // code
            self.imageRendu.image = UIImage(named: "carte.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbmaarouf")
            self.Rentability = 2.5
            self.SaveCard = "maarouf"
        }
        if self.pickerData[row] == "Goguey TOTY"{
            // code
            self.imageRendu.image = UIImage(named: "carte6.png")
            self.initMaxCompteur(Entite: "Cards", sousEntite: "nbgogueyToty")
            self.Rentability = 4.5
            self.SaveCard = "gogueyToty"
        }
    }
    
    @IBOutlet weak var venteItemNav : UITabBarItem!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imageRendu : UIImageView!
    @IBOutlet weak var moinsPlus : UIStepper!
    @IBOutlet weak var moinsPlusLabel : UILabel!
    @IBOutlet weak var gemWin : UILabel!
    @IBOutlet weak var saleButton : UIButton!
    
    public var pickerData: [String] = [String]()
    
    public var Rentability : Float!
    public var SaveCard : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.easterEgg1()
        /// Data Connexion --> Delegate
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
        self.pickerData = ["Gaillard", "Goguey", "Muridi", "Maarouf", "Salaun", "Goguey TOTY"]
        self.venteItemNav.isEnabled = true
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let context = appDelegate.persistentContainer.viewContext
        //let pseudoSave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        //print(pseudoSave.value(forKey: "easterEggActivate1") as? Bool)
        //print(pseudoSave.value(forKey: "pseudo") as? String)
    }
    override func viewWillAppear(_ animated: Bool) {
        //code
    }
    public func easterEgg1(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //let pseudoSave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                if let r = results.first as? NSManagedObject{
                    if r.value(forKey: "easterEggActivate1") as? Bool == true{
                        self.venteItemNav.isEnabled = true
                        print("ok")
                    } else {
                        print("nok")
                        self.venteItemNav.isEnabled = false
                    }
                }
            }
        }catch{
            print("erreur inconnue")
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        self.moinsPlusLabel.text = Int(sender.value).description
        let gemCalcul = Int(self.Rentability) * Int(sender.value)
        self.gemWin.text = String(gemCalcul)
        if Int(sender.value) == 0 || self.moinsPlusLabel.text == "Label"{
            self.moinsPlusLabel.text = ""
        }
        if Int(sender.value) <= 0{
            self.moinsPlusLabel.text = "0"
        }

    }
    
    public func resetNombre(){
        let nombre = 0
        self.moinsPlus.value = Double(nombre)
        self.moinsPlusLabel.text = String(self.moinsPlus.value)
    }
    
    public func initMaxCompteur(Entite: String, sousEntite: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Entite)
        do{
            self.resetNombre()
            let results = try context.fetch(request)
            if(results.count > 0){
                for r in results as! [NSManagedObject]{
                    if r.value(forKey: sousEntite) as? Int != nil{
                        self.moinsPlus.maximumValue = Double(r.value(forKey: sousEntite) as! Int)
                    }
                }
            }
        }catch{
            print("Error Core Data")
        }
    }
    
    @IBAction func saleCard(_ sender: UIButton!){
        _ = Int(gemWin.text!)
        let numberCards = Int(self.moinsPlusLabel.text!)
        var saleOperation = 0
        if numberCards! >= 0 {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
            let saleSave = NSEntityDescription.insertNewObject(forEntityName: "Cards", into: context)
            do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for r in results as! [NSManagedObject]{
                        let gaillard = (r.value(forKey: "nbgaillard") as? Int)!
                        let goguey = (r.value(forKey: "nbgoguey") as? Int)!
                        let muridi = (r.value(forKey: "nbmuridi") as? Int)!
                        let maarouf = (r.value(forKey: "nbmaarouf") as? Int)!
                        let salaun = (r.value(forKey: "nbsalaun") as? Int)!
                        let gogueyToty = (r.value(forKey: "nbgogueyToty") as? Int)!
                        
                        if self.SaveCard == "gaillard"{
                            saleOperation = gaillard - numberCards!
                            r.setValue(saleOperation, forKey: "nbgaillard")
                            saleSave.setValue(saleOperation, forKey: "nbgaillard")
                            print("gaillard vendus")
                            try context.save()
                        }
                        
                        if self.SaveCard == "goguey"{
                            saleOperation = goguey - numberCards!
                            r.setValue(saleOperation, forKey: "nbgoguey")
                            try context.save()
                        }
                        
                        if self.SaveCard == "muridi"{
                            saleOperation = muridi - numberCards!
                            r.setValue(saleOperation, forKey: "nbmuridi")
                            try context.save()
                        }
                        
                        if self.SaveCard == "salaun"{
                            saleOperation = salaun - numberCards!
                            r.setValue(saleOperation, forKey: "nbsalaun")
                            try context.save()
                        }
                        
                        if self.SaveCard == "maarouf"{
                            saleOperation = maarouf - numberCards!
                            r.setValue(saleOperation, forKey: "nbmaarouf")
                            try context.save()
                        }
                        
                        if self.SaveCard == "gogueyToty"{
                            saleOperation = gogueyToty - numberCards!
                            r.setValue(saleOperation, forKey: "nbgogueyToty")
                            try context.save()
                        }
                        
                        try context.save()
                    }
                }
            } catch {
                print("erreur --> vente de cartes")
            }
            
        } else {
            self.saleButton.isEnabled = false
        }
    }
}
