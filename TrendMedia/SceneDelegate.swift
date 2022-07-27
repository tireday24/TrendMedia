//
//  SceneDelegate.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //수많은 뷰 중에 어떤 뷰를 보여줄지 결정해주는 프로퍼티
    var window: UIWindow?


    //시작 화면전에 통제 가능
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //true이면 ViewController , false SearchTableViewController
        //SceneDelegate에 있으면 안되는 코드 -> 시작할때마다 false
        //UserDefaults.standard.set(false, forKey: "First") -> 다른 화면에 배치해야한다
        //UserDefaults.standard.set(false, forKey: "First")
        
        guard let scene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: scene)
//        
//        if UserDefaults.standard.bool(forKey: "First") {
//            
//            
//            //첫번째 화면 구성
//            let sb = UIStoryboard(name: "Trend", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            
//            //코드로 루트뷰컨트롤러 지정 가능
//            window?.rootViewController = vc
//            
//            //중요 디바이스 화면에 비춰주는 역할
//            window?.makeKeyAndVisible()
//        } else {
//            
//            window = UIWindow(windowScene: scene)
//            
//            //첫번째 화면 구성
//            let sb = UIStoryboard(name: "Search", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
//            
//            //코드로 루트뷰컨트롤러 지정 가능 , 네비게이션컨트롤러 임베디드
//            
//            
//            //중요 디바이스 화면에 비춰주는 역할
//            window?.makeKeyAndVisible()
//            
//        }
//        
//        window?.makeKeyAndVisible()
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

