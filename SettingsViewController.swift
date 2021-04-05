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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.syncAllSwitch()
    }
    
    @IBAction func paymentSwitchClicked(_ sender: Any){
        if self.paymentSwitch.isOn{
            self.paymentIsOnInit()
        } else{
            self.paymentIsOffInit()
        }
    }
    
    public func paymentIsOnInit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for setting in results as! [NSManagedObject]{
                        setting.setValue(true, forKey: "payments")
                        try context.save()
                    }
                }
            try context.save()
        }catch{
            print("erreur lors de l'initialisation/sauvegarde des paramètres")
        }
    }
    
    public func paymentIsOffInit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for setting in results as! [NSManagedObject]{
                        setting.setValue(false, forKey: "payments")
                        try context.save()
                    }
                }
            try context.save()
        }catch{
            print("erreur lors de l'initialisation/sauvegarde des paramètres")
        }
    }
    
    public func syncAllSwitch(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for switchStatePayments in results as! [NSManagedObject]{
                        if switchStatePayments.value(forKey: "payments") as? Bool == false{
                            self.paymentSwitch.setOn(false, animated: true)
                        } else{
                            self.paymentSwitch.setOn(true, animated: true)
                        }
                    }
                }
        }catch{
            print("erreur lors de la synchronisation de l'état des switchs")
        }
    }
    
    @IBAction func saveSettings(){
        self.syncAllSwitch()
    }
}
