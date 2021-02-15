//
//  ViewController.swift
//  Lesson-8. MVC P
//
//  Created by Alikhan Tuxubayev on 15.02.2021.
//

import UIKit
import Moya

class MainViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    var cardView = CardView()
    let provider = MoyaProvider<APIService>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        searchBar.delegate = self
        setupViews()
    
    }
    
    private func setupViews(){
        [searchBar, cardView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
       searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
       searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
       searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
       cardView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
       cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
       cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
       cardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
       cardView.layer
        
    
       }
    
    // MARK: - NETWORKING -
    
    private func getSynonims(_ text: String){
        provider.request(.getSynonims(text: text)) {[weak self] result in
            switch result{
            case .success(let response):
                do {
//                    if let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [[String: Any]]{
//                        print("json: \(json)")
//                    }
                    let wordnikResponse = try JSONDecoder().decode([WordnikResponse].self, from: response.data)
                    guard let synonims = wordnikResponse.first, let firstSynonim = synonims.words.first else {
                        return
                    }
                    self?.cardView.setText(firstSynonim)
                } catch let error {
                    print("error in parsing: \(error)")
                }
            case .failure(let error):
                let requestError = (error as NSError)
                print("RequestError message: \(requestError.localizedDescription), code: \(requestError.code)")
            }
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange: \(searchText)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        getSynonims(searchText.lowercased())
    }
    
    // Скрытие клавиатуры
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}
