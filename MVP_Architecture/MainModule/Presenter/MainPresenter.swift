//
//  MainPresentor.swift
//  TestProjectTSD
//
//  Created by Denis Dareuskiy on 26.07.24.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
   init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }

}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var comments: [Comment]?
    
    required init(view:  MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
