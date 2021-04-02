//
//  LoginViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 27/02/2021.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var pseudo : UITextField!
    @IBOutlet weak var playButton : UIButton!
    @IBOutlet weak var settingsButton : UIButton!
    @IBOutlet weak var pseudoLabelLink : UILabel!
    //@IBOutlet weak var textfield : UITextField!
    
    
    
    public var pseudoEntree : Bool!
    public var pseudoUtilisateur : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.isHidden = false
        self.pseudoEntree = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let pseudoSave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        pseudoSave.setValue(self.pseudoEntree, forKey: "pseudoEntree")
        //let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        // Do any additional setup after loading the view.
        self.syncPseudoText()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
    @IBAction func sendDataButton(_ sender: UIButton){
        self.pseudoEntree = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let pseudoSave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        //self.pseudoUtilisateur = self.pseudo.text
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if(results.count > 0 ){
                for r in results as! [NSManagedObject]{
                    if r.value(forKey: "pseudoEntree") as? Bool == false{
                        do{
                            r.setValue(self.pseudo.text, forKey: "pseudo")
                            r.setValue(true, forKey: "pseudoEntree")
                            pseudoSave.setValue(self.pseudo.text, forKey: "pseudo")
                            pseudoSave.setValue(true, forKey: "pseudoEntree")
                            try context.save()
                        }
                        catch{
                            ///r.setValue(r.value(forKey: "pseudo") as? String, forKey: "pseudo")
                            pseudoSave.setValue(r.value(forKey: "pseudo") as? String, forKey: "pseudo")
                            
                            ///try context.save()
                            print("Erreur lors de l'enregistrement du pseudo")
                            try context.save()
                        }
                    }
                    else {
                        //self.pseudo.text = r.value(forKey: "pseudo") as? String
                        //pseudoSave.setValue(self.pseudo.text, forKey: "pseudo")
                        pseudoSave.setValue(true, forKey: "pseudoEntree")
                        try context.save()
                    }
                }
            }
            try context.save()
        }catch{
            print("Erreur")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                for r in results as! [NSManagedObject]{
                    if r.value(forKey: "pseudoEntree") as? Bool == true{
                        self.pseudo.isHidden = true
                        self.pseudoLabelLink.isHidden = true
                        //print(r.value(forKey: "pseudo") as! String)
                    }
                    
                }
            }
        }catch{
            print("Erreur")
        }
    }
    
    public func syncPseudoText(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let results = try context.fetch(request)
            if(results.count > 0 ){
                for r in results as! [NSManagedObject]{
                    self.pseudoUtilisateur = r.value(forKey: "pseudo") as? String
                    self.pseudo.text = self.pseudoUtilisateur
                }
            }
        }catch{
            print("Erreur")
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
