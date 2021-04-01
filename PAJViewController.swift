//
//  PAJViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 09/03/2021.
//

import UIKit
import CoreData

class PAJViewController: UIViewController {
    @IBOutlet weak var obtenuPAJ : UILabel!
    @IBOutlet weak var imagePAJ : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cards")
        request.returnsObjectsAsFaults = false
        do{
                let results = try context.fetch(request)
                if(results.count > 0){
                    for r in results as! [NSManagedObject]{
                        if r.value(forKey: "paj") as? Bool == true{
                            self.imagePAJ.image = UIImage(named: "linux.png")
                            self.obtenuPAJ.text = "Obtenu avec succès !"
                        }
                    }
                }
            }catch{
                print("Objet Core Data introuvable")
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
