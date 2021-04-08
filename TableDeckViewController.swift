//
//  TableDeckViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 06/04/2021.
//

import UIKit

class TableDeckViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cardNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! DeckTableViewCell
        cell.imageCard.image = self.cardImages[indexPath .row]
        
        let card = doc[indexPath .row]
        cell.name.text = card.name
        cell.life.text = String(card.life)
        cell.attack.text = String(card.attack)
        
        cell.layer.borderColor = CGColor.init(gray: 255, alpha: 0)
            cell.layer.borderWidth = 3
        //cell.choiceButton.setTitle(self.cardNames[indexPath .row], for: .normal)
    return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let cardNames = [("Faillard"),("Goglix"),("Muridi"),("Lbath 7"),("Carton"),("Monseign."),("Goglix Toty"), ("Sal1"), ("Faarouf"), ("Vlestid"), ("Le Boss")]
    let cardImages = [UIImage(named: "carte2"), UIImage(named: "carte5"), UIImage(named: "carte6"), UIImage(named: "carte11"), UIImage(named: "carte10"), UIImage(named: "carte8"), UIImage(named: "carte3"), UIImage(named: "carte1"), UIImage(named: "carte0"), UIImage(named: "carte9"), UIImage(named: "carte7")]
    
    let doc = [
        (name: "Faillard", life: 0.2, attack: 0.01, image: "carte2"),
        (name: "Goglix", life: 0.3, attack: 0.02, image: "carte5"),
        (name: "J.Muridi", life: 0.3, attack: 0.02, image: "carte6"),
        (name: "LBath 7", life: 0.2, attack: 0.01, image: "carte11"),
        (name: "L.Carton", life: 0.6, attack: 0.04, image: "carte10"),
        (name: "Monseign.", life: 1.0, attack: 0.08, image: "carte8"),
        (name: "G.TOTY", life: 0.6, attack: 0.04, image: "carte3"),
        (name: "Gwen Sal1", life: 0.5, attack: 0.03, image: "carte1"),
        (name: "Faarouf", life: 0.5, attack: 0.03, image: "carte0"),
        (name: "Vlestid", life: 0.4, attack: 0.04, image: "carte9"),
        (name: "Le Boss", life: 1.0, attack: 0.1, image: "carte7")
    ]
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "CHOISISSEZ LA CARTE QUI COMBATTRA"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "startFight", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FightViewController{
            destination.userSyncTableData = doc[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
