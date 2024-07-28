//
//  ModuleBuilder.swift
//  TestProjectTSD
//
//  Created by Denis Dareuskiy on 26.07.24.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
     func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: any RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment: Comment?, router: any RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}
