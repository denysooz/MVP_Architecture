//
//  RouterTest.swift
//  MVP_ArchitectureTests
//
//  Created by Denis Dareuskiy on 27.07.24.
//

import XCTest
@testable import MVP_Architecture

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AssemblyModuleBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }
}
