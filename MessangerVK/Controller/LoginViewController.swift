//
//  LoginViewController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 04.05.2022.
//

import UIKit
import WebKit
import Foundation

final class LoginViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: config)
        return view
    }()

    override func loadView() {
        super.loadView()
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        loadAuth()

    }
    /*
    //MARK: - Friends User
    func getFriends() {
        let token = Singleton.instance.token
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
       
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "sex, bdate, city, country, photo_100"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        print(urlConstructor)
    }
     */
    /*
    //MARK: - Groups User
    func getGroups() {
        guard let token = Singleton.instance.token else { return }
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
       
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "owner_id", value: String(Singleton.instance.userId)),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1")
        ]
        print(urlConstructor)
    }
    
    //MARK: - Photos User
    func getPhotos() {
        guard let token = Singleton.instance.token else { return }
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
       
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "owner_id", value: String(Singleton.instance.userId)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        print(urlConstructor)
    }
    */
}

// MARK: - WKNavigationDelegate
extension LoginViewController: WKNavigationDelegate {
   
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"],
        let userId = params["user_id"],
        let id = Int(userId) {
            Singleton.instance.loginUser(with: token, userID: id)
            print(token)
            print(id)
           
/*
        if let token = params["access_token"], let id = params["user_id"] {
            Singleton.instance.userId = Int(id) ?? 0
            Singleton.instance.token = token
            print(token)
            decisionHandler(.cancel)
            performSegue(withIdentifier: "TabBarSegue", sender: nil)
        }
 */
    }
        decisionHandler(.cancel)
    performSegue(withIdentifier: "TabBarSegue", sender: nil)
}
}

private extension LoginViewController {
    func configureWebView() {
        navigationController?.navigationBar.isHidden = true
        webView.navigationDelegate = self
    }

    func loadAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8126570"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "0")
        ]

        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        print(urlComponents)
        webView.load(request)
    }
}
