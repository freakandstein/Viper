//
//  MainView.swift
//  Viper
//
//  Created by satrio.wicaksono on 16/09/20.
//  Copyright © 2020 Playground. All rights reserved.
//

import Foundation
import UIKit
import NetworkService

class MainView: UIViewController {
    
    //MARK: Properties
    private let bundle = Bundle(for: MainView.self)
    private let className = String(describing: MainView.self)
    
    //MARK: Initialize
    init() {
        super.init(nibName: className, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
