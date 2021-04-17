//
//  MultiplayerViewController.swift
//  OpenProf
//
//  Created by Adam HAISSOUBI-VOGIER on 09/04/2021.
//

import UIKit
import GameKit
import CoreData
//import Foundation

class MultiplayerViewController: UIViewController, GKGameCenterControllerDelegate, GKMatchmakerViewControllerDelegate, GKLocalPlayerListener, GKMatchDelegate {
    
    // Surcharge méthode 1
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        NSLog("Match annulé en raison d'une erreur de matchmaking")
        dismiss(animated: true, completion: nil)
    }
    // Surcharge méthode 2
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        NSLog("Erreur lors de la recherche d'adversaires...")
        
    }
    
    var player = GKLocalPlayer()
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    /* Variables */
    var gcEnabled = Bool() // Check if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Check the default leaderboardID
    var score = 0
    let LEADERBOARD_ID = "openprof.challenge"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateLocalPlayer()
        // Do any additional setup after loading the view.
    }
    
    
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1. Show login if player is not logged in
                self.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                // 2. Player is already authenticated & logged in, load game center
                self.gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { self.gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
                
            } else {
                // 3. Game center is not enabled on the users device
                self.gcEnabled = false
                print("Local player could not be authenticated!")
                print(error!)
            }
            GKLocalPlayer.local.register(self)
        }
    }
    
    
    @IBAction func checkGCLeaderboard(_ sender: AnyObject) {
        let gcVC = GKGameCenterViewController(leaderboardID: LEADERBOARD_ID, playerScope: .global, timeScope: .allTime)
        gcVC.gameCenterDelegate = self
        present(gcVC, animated: true, completion: nil)
    }
    
    
    @IBAction func viewPlayers(_ sender: UIButton){
        self.presentMatchmaker()
    }
    var viewController : UIViewController!
    
    func presentMatchmaker() {
        guard GKLocalPlayer.local.isAuthenticated else {
            return
        }
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        request.inviteMessage = "Battons nous dans un duel sordide !"
        
        let vc = GKMatchmakerViewController(matchRequest: request)
        vc?.matchmakerDelegate = self
        vc?.matchmakingMode = GKMatchmakingMode.nearbyOnly
        present(vc!, animated: true, completion: nil)
    }
    
    func player(_ player: GKPlayer, didAccept invite: GKInvite) {
        let viewController = GKMatchmakerViewController(invite: invite)
        viewController?.matchmakerDelegate = self
        let rootViewController = UIApplication.shared.windows.first!.rootViewController
        rootViewController?.present(viewController!, animated: true, completion: nil)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController,
                                  didFind match: GKMatch) {
        // On retire le VC
        viewController.dismiss(animated: true, completion: nil)
        
        // Délégation du match
        match.delegate = self
        
        // Commencer le match
        if match.expectedPlayerCount == 0 {
            viewController.addPlayers(to: match)
            self.startPlayingMultiplayer()
        }
    }
    
    func player(_ player: GKPlayer, receivedTurnEventFor match: GKTurnBasedMatch, didBecomeActive: Bool
    ){
        guard didBecomeActive else {
            return
            
            //NotificationCenter.default.post(name:, object: "Un inconnue vous lance un défi")
        }
        
    }
    
    public func startPlayingMultiplayer(){
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "multiplayerChoice") as! RingMultiPlayerViewController  //The file that controls the view
        //self.winOrNotCardLevel()
        self.present(VC, animated: true, completion: nil)
    }
    
}
