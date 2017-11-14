//
//  AppDelegate.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/7/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    let subjectsInfo = ["Mathematics": ["image": "calculator", "desc": "Get out that calculator!"], "Marvel Super Heroes": ["image": "marvel", "desc": "Join Earth's Mightiest Heroes!"], "Science": ["image": "science", "desc": "Test your scientific prowess!"]]
    // questions for quizzes
    var mathematics: [Dictionary<String, String>] = [["question": "What is the mean of the following numbers: 3, -7, 5, 13, -2?", "option1": "3.3", "option2": "2.4", "option3": "8", "option4": "-0.6", "answer": "2.4"], ["question": "Solve for x: 5x - 6 = 3x - 8", "option1": "-1", "option2": "0.5", "option3": "-2", "option4": "1", "answer": "-1"]]
    var science: [Dictionary<String, String>] = [["question": "What is sodium chloride (NaCl)?", "option1": "Table Sugar", "option2": "Baking Soda", "option3": "Lead", "option4": "Table Salt", "answer": "Table Salt"]]
    var marvel: [Dictionary<String, String>] = [["question": "Which infinity stone is the Tesseract?", "option1": "Space Stone", "option2": "Mind Stone", "option3": "Reality Stone", "option4": "Power Stone", "answer": "Space Stone"], ["question": "Which of these is NOT one of Marvel Comics former names?", "option1": "Atlas Comics", "option2": "National Comics Publications", "option3": "Timely Publications", "option4": "All of the Above", "answer": "National Comics Publications"], ["question": "The Silver Surfer is from the planet...", "option1": "Earth", "option2": "Gallifrey", "option3": "Zenn-La", "option4": "Morag", "answer": "Zenn-La"]]

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

