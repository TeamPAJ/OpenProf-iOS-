//
//  SettingsViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 05/04/2021.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var paymentSwitch : UISwitch!
    @IBOutlet weak var linksSwitch : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.syncAllSwitch()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.syncAllSwitch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.syncAllSwitch()
    }
    
    
    
    @IBAction func paymentSwitchClicked(_ sender: Any){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        let settingPaymentSave = NSEntityDescription.insertNewObject(forEntityName: "Settings", into: context)
        if self.paymentSwitch.isOn{
            do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    if (results.first as? NSManagedObject) != nil{
                        //setting.setValue(true, forKey: "payments")
                        settingPaymentSave.setValue(true, forKey: "payments")
                        try context.save()
                        print("switch --> true")
                    }
                }
            }catch{
                print("erreur lors de l'initialisation/sauvegarde des paramètres")
            }
        } else{
            do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    if (results.first as? NSManagedObject) != nil{
                        //setting.setValue(false, forKey: "payments")
                        settingPaymentSave.setValue(false, forKey: "payments")
                        try context.save()
                        print("switch --> false")
                    }
                }
            }catch{
                print("erreur lors de l'initialisation/sauvegarde des paramètres")
            }
        }
        print("off")
    }
    
    @IBAction func externalLinksClicked(_ sender: Any){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        let settinglinkSave = NSEntityDescription.insertNewObject(forEntityName: "Settings", into: context)
        request.returnsObjectsAsFaults = false
        if self.linksSwitch.isOn{
            do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    if (results.first as? NSManagedObject) != nil{
                        //settingLink.setValue(true, forKey: "externalLinks")
                        settinglinkSave.setValue(true, forKey: "externalLinks")
                        try context.save()
                        
                    }
                }
            }catch{
                print("erreur lors de l'initialisation/sauvegarde des paramètres")
            }
            print("on")
        } else{
            do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    if (results.first as? NSManagedObject) != nil{
                        //settingLink.setValue(true, forKey: "externalLinks")
                        settinglinkSave.setValue(false, forKey: "externalLinks")
                        try context.save()
                    }
                }
            }catch{
                print("erreur lors de l'initialisation/sauvegarde des paramètres")
            }
            print("off")
        }
    }
    
    
    
    public func syncAllSwitch(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        let allsettings = NSEntityDescription.insertNewObject(forEntityName: "Settings", into: context)
        do{
            let results = try context.fetch(request)
            if(results.count > 0){
                for r in results as! [NSManagedObject]{
                    if r.value(forKey: "payments") as? Bool == true{
                        self.paymentSwitch.setOn(true, animated: true)
                    }
                    if r.value(forKey: "payments") as? Bool == false{
                        self.paymentSwitch.setOn(false, animated: true)
                    }
                    if r.value(forKey: "externalLinks") as? Bool == true{
                        self.linksSwitch.setOn(true, animated: true)
                    }
                    if r.value(forKey: "externalLinks") as? Bool == false{
                        self.linksSwitch.setOn(false, animated: true)
                    }
                }
            }
        }catch{
            print("erreur")
        }
    }
    
    @IBAction func saveSettings(){
    }
}
