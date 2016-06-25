//
//  ViewController.swift
//  NSwinjectDemo
//
//  Created by Nghia Nguyen on 6/24/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import UIKit
import NSwinject
import Swinject

class ViewController: UIViewController {
    private let viewModel = Injected<ViewModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        print("\(viewModel.value?.desc())")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol ViewModel {
    func desc() -> String
}

class ViewModelImp: AnyObject, ViewModel {
    
    private let apiInject = Injected<ApiClient>()
    
    func desc() -> String {
        return "Nghia" + (self.apiInject.value?.decs() ?? "")
    }
}

class ViewModel2Imp: AnyObject, ViewModel {
    func desc() -> String {
        return "Fake"
    }
}

class ApiClient: AnyObject {
    func decs() -> String {
        return "Vip"
    }
}

extension Container {
    static func allContainers() -> [Container] {
        return [self.modelsContainer(), self.networkContainer()]
    }
    
    static func modelsContainer() -> Container {
        return Container { container in
            container.register {ViewModelImp() as ViewModel}
        }
    }
    
    static func fakeModelsContainer() -> Container {
        return Container { container in
            container.register {ViewModel2Imp() as ViewModel}
        }
    }
    
    static func networkContainer() -> Container {
        return Container { container in
            container.register { ApiClient() }
        }
    }
}

extension ViewController {
    static func getInstance() -> ViewController {
        return ViewController() <- [Container.modelsContainer(), Container.networkContainer()]
    }
}

