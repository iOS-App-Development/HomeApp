//
//  ViewController.swift
//  HomeAppiOS
//
//  Created by Muzammil Peer on 27/01/2022.
//

import UIKit
import HomeFeature
import CoreModule
import HTTPClientModule
import APIClientModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.test_endToEndTestServerGETFruits()
        
        
    }
    
    func buildHomeModule()
    {
        let homeService = HomeService.init(httpClient: ephemeralClient(), baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)
        let accountService = AccountService.init(httpClient: ephemeralClient(), baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)

        let homeModule:HomeFeature = HomeFeature.init(settings: Settings.init(), homeServices: homeService, accountServices: accountService, userInfoProvider: UserInfoProvider.init())
        homeModule.start(on: self.navigationController!)
    }

    private func ephemeralClient(file: StaticString = #filePath, line: UInt = #line) -> HTTPClient {
        let client = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
//        trackForMemoryLeaks(client, file: file, line: line)
        return client
    }

//    func test_endToEndTestServerGETFruits() {
//        let service = HomeService.init(httpClient: ephemeralClient(), baseURL: URL.init(string: "https://api.themoviedb.org/3/")!)
//        service.getMoviePopularList { resultObjects in
//            switch resultObjects {
//            case let .success(fruits)?:
//                print("how many objects %d",fruits.first?.originalTitle)
//            case let .failure(error)?:
//                print("failed:\(error)")
//
//            default:
//                print("failed")
//            }
//        }
//    }
    
    @IBAction func actionHomeScreen(_ sender: Any) {
        self.buildHomeModule()
    }
    
}

