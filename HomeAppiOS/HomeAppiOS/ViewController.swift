//
//  ViewController.swift
//  HomeAppiOS
//
//  Created by Muzammil Peer on 27/01/2022.
//

import UIKit
import CoreModule
import HomeFeature

class ViewController: UIViewController {

    override func viewDidLoad() {
       super.viewDidLoad()

    }
    private func buildHomeScreen()
    {
        let client = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
        let homeService = HomeService.init(httpClient: client, baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)
        let accountService = AccountService.init(httpClient: client, baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)
        let homeModule:HomeFeature = HomeFeature.init(settings: Settings.init(), homeServices: homeService, accountServices: accountService, userInfoProvider: UserInfoProvider.init())
        homeModule.start(on: self.navigationController!)
    }

    @IBAction func actionHomeScreen(_ sender: Any) {
        self.buildHomeScreen()
    }
    
}

