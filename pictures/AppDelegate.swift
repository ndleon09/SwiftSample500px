//
//  AppDelegate.swift
//  pictures
//
//  Created by Nelson Dominguez on 04/11/15.
//  Copyright © 2015 Nelson Dominguez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let container: ServiceLocator = {
        let container = Container()
        
        let networkService: NetworkingServiceProtocol = NetworkingService()
        container.add(service: networkService)
        
        let persistenceLayer: PersistenceLayerProtocol = PersistenceLayer()
        container.add(service: persistenceLayer)
        
        // Register ListModule components
        let listWireFrame: ListWireFrameProtocol = ListWireFrame(container: container)
        container.add(service: listWireFrame)
        
        let listDataManager: ListDataManagerProtocol = ListDataManager()
        listDataManager.networkService = networkService
        listDataManager.persistenceLayer = persistenceLayer
        container.add(service: listDataManager)
        
        let listInteractor: ListInteractorInputProtocol = ListInteractor()
        listInteractor.dataManager = listDataManager
        container.add(service: listInteractor)
        
        let listPresenter: ListPresenterProtocol = ListPresenter()
        listPresenter.listWireFrame = listWireFrame
        listPresenter.listInteractor = listInteractor
        container.add(service: listPresenter)
        
        let listView: ListViewInterfaceProtocol = ListViewController()
        listView.listPresenter = listPresenter
        container.add(service: listView)
        
        // Cyrcle dependencies
        listPresenter.listView = listView
        listInteractor.output = listPresenter as? ListInteractorOutputProtocol
        
        // Register DetailModule components
        let detailWireframe = DetailWireFrame(container: container)
        container.add(service: detailWireframe)
        
        let detailDataManager: DetailDataManagerProtocol = DetailDataManager()
        detailDataManager.persistenceLayer = persistenceLayer
        container.add(service: detailDataManager)
        
        let detailInteractor: DetailInteractorInputProtocol = DetailInteractor()
        detailInteractor.dataManager = detailDataManager
        container.add(service: detailInteractor)
        
        let detailPresenter: DetailPresenterProtocol = DetailPresenter()
        detailPresenter.wireFrame = detailWireframe
        detailPresenter.interactor = detailInteractor
        container.add(service: detailPresenter)
        
        let detailView: DetailViewProtocol = DetailViewController()
        detailView.detailPresenter = detailPresenter
        container.add(service: detailView)
        
        // Cyrcle dependencies
        detailInteractor.output = detailPresenter as? DetailInteractorOutputProtocol
        detailPresenter.view = detailView
        
        return container
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let rootWireFrame = RootWireFrame(container: container)
        rootWireFrame.installRootViewController(in: window!)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

