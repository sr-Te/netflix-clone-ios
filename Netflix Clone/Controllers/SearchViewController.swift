//
//  SearchViewController.swift
//  Nextflix Clone
//
//  Created by srte on 21-04-22.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.backgroundColor = .systemBackground
    }
}
