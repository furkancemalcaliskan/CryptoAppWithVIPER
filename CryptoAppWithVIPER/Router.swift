//
//  Router.swift
//  CryptoAppWithVIPER
//
//  Created by Furkan Cemal Çalışkan on 9.10.2022.
//

import Foundation
import UIKit

// Class, protocol
// EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
    
}

class CryptoRouter : AnyRouter {
    
    var entry: EntryPoint?
        
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
        
    }
    
}
