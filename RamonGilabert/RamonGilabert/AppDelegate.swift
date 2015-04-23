//
//  AppDelegate.swift
//  RamonGilabert
//
//  Created by Ramon Gilabert Llop on 4/18/15.
//  Copyright (c) 2015 Ramon Gilabert. All rights reserved.
//

import UIKit

struct Video {
    static let MainVideoURL: NSURL = NSBundle.mainBundle().URLForResource("intro_video", withExtension: "m4v")!
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    let mainViewController = RGMainViewController()

    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()

    return true
  }
}

