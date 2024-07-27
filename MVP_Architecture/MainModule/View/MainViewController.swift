//
//  ViewController.swift
//  TestProjectTSD
//
//  Created by Denis Dareuskiy on 26.07.24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var greetingLabeL: UILabel!
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .light
    }
    // MARK: - IBAction
    @IBAction func didTapButton(_ sender: Any) {
        self.presenter.showGreeting()
    }

}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabeL.text = greeting
    }
}

