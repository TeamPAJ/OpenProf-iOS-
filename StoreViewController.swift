//
//  StoreViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 13/02/2021.
//

import UIKit
import CoreData

class StoreViewController: UIViewController {

    @IBOutlet weak var obtenirMoney : UIButton!
    let timeEnd = NSDate(timeInterval: 1*2*60, since: NSDate() as Date)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func obtenirMoneyEvent(_ sender: UIButton){
        // Core Data datas connexion
        self.timerRecompense()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if let user = results.first as? NSManagedObject {
                if var money = user.value(forKey: "money") as? Int {
                    // code
                    print(money)
                    money = money + 100
                    do{
                            let results = try context.fetch(request)
                        if let user = results.first as? NSManagedObject {
                            user.setValue(money, forKey: "money")
                            try context.save()
                        } else {
                            let moneySave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                            moneySave.setValue(money, forKey: "money")
                            try context.save()
                        }
                    }catch{
                        print("Objet Core Data introuvable")
                        let moneySave = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
                        moneySave.setValue(money, forKey: "money")
            //            try context.save()
                    }
                    print(money)
                    try context.save()
                }
            }
        }catch{
            print("Error Core Data")
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            try context.save()
        }catch{
            print("error")
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
    public func timeCountAnim(){
        // Date configuration
        
        // Core Data Link
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        _ = NSEntityDescription.insertNewObject(forEntityName: "Delai", into: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Delai")
        request.returnsObjectsAsFaults = false
        
    }
    public func timerRecompense() {
        var _: Timer?
        var timeLeft = 45

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeLeft != 0 {
                ///print("\(timeLeft)")
                timeLeft -= 1
                self.obtenirMoney.setTitle(String(timeLeft), for: .normal)
                self.obtenirMoney.isOpaque = true
                self.obtenirMoney.isEnabled = false
            } else {
                timer.invalidate()
                self.obtenirMoney.setTitle("", for: .normal)
                self.obtenirMoney.isOpaque = false
                self.obtenirMoney.isEnabled = true
            }
        }
    }

}
