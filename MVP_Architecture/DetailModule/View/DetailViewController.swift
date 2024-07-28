//
//  DetailViewController.swift
//  MVP_Architecture
//
//  Created by Denis Dareuskiy on 26.07.24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    
    @IBAction func tapAciton(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
    
    
}
