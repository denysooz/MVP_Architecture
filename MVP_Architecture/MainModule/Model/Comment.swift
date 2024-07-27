//
//  Person.swift
//  TestProjectTSD
//
//  Created by Denis Dareuskiy on 26.07.24.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
