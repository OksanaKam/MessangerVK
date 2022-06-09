//
//  LoginController.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 01.05.2022.
//

import UIKit
import WebKit

final class LoginController: UIViewController {
    
    @IBOutlet var webView: WKWebView! 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8155220"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "revoke", value: "0")
        ]

        //guard let url = urlComponents.url else { return }
        let request = URLRequest(url: urlComponents.url!)
        print("load web view")
        webView.load(request)
         
    }
}

// MARK: - WKNavigationDelegate
extension LoginController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
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
        print(params)
        
        
        Singleton.instance.userId = Int(params["user_id"]!) ?? 0
        Singleton.instance.token = params["access_token"]!
        decisionHandler(.cancel)
        //performSegue(withIdentifier: "TabBarSegue", sender: nil)
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "tabBar") as! TabBarController
        navigationController?.pushViewController(vc, animated: true)

        /*
        if let token = params["access_token"], let id = params["user_id"] {
            Singleton.instance.userId = Int(id)
            Singleton.instance.token = token
            print(token)
            decisionHandler(.cancel)
            
            let vc = UITabBarController()
            navigationController?.pushViewController(vc, animated: true)
            //performSegue(withIdentifier: "TabBarSegue", sender: self)
  */
        /*
            guard let token = params["access_token"],
                  let id = params["user_id"],
                  //let _ = Int(id) else {
                  let userID = Int(id) else {
                decisionHandler(.allow)
                return
            }
        
        //Singleton.instance.userId = Int(id)
        Singleton.instance.token = token
        Singleton.instance.userId = userID
        decisionHandler(.cancel)
        print(token)
        
        performSegue(withIdentifier: "TabBarSegue", sender: nil)
        */
       /*
        let id = params["user_id"]
        Singleton.instance.userId = Int(id ?? " ")
        Singleton.instance.token = params["access_token"]!
                
        decisionHandler(.cancel)
        performSegue(withIdentifier: "TabBarSegue", sender: nil)
*/
    }
    /*
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    }
     */
}


private extension LoginController {
    /*
    func configureWebView() {
        navigationController?.navigationBar.isHidden = true
        webView.navigationDelegate = self
    }
*/
    /*
    func loadAuth() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8155220"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "revoke", value: "0")
        ]
        
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
     */

}
