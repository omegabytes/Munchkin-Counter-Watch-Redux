//
//  InterfaceController.swift
//  MunchkinWatchApp WatchKit Extension
//
//  Created by Alex Gaesser on 3/9/15.
//  Copyright (c) 2015 AlexGaesser. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var totalLabel: WKInterfaceLabel!
    @IBOutlet weak var levelLabel: WKInterfaceLabel!
    @IBOutlet weak var combatLabel: WKInterfaceLabel!
    @IBOutlet weak var oneShotLabel: WKInterfaceLabel!
    
    var level = 1
    var combat = 0
    var oneShot = 0
    var effectiveCombat = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // buttons
    
    @IBAction func clearButtonPressed() {
        level = 1
        combat = 0
        oneShot = 0
        effectiveCombat = 0
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func addLevelButtonPressed() {
        if level < 10 {
            level += 1
        }
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func subtractLevelButtonPressed() {
        if level > 1 {
            level -= 1
        }
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func addCombatButtonPressed() {
        combat += 1
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func subtractCombatButtonPressed() {
        combat -= 1
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func addOneShotButtonPressed() {
        oneShot += 1
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    @IBAction func subtractOneShotButtonPressed() {
        oneShot -= 1
        calculateAndUpdate(level, combat: combat, oneShot: oneShot)
    }
    
    // helper functions
    
    func calculateEffectiveCombat (level: Int, combat: Int, oneShot: Int) -> Int {
        var effectiveCombat = level + combat + oneShot
        
        return effectiveCombat
    }
    
    func calculateAndUpdate (level: Int, combat: Int, oneShot: Int) {
        levelLabel.setText("\(level)")
        combatLabel.setText("\(combat)")
        oneShotLabel.setText("\(oneShot)")
        
        effectiveCombat = calculateEffectiveCombat(level, combat: combat, oneShot: oneShot)
        
        totalLabel.setText("\(effectiveCombat)")
    }
    
    
}
