//
//  UserModel.swift
//  Echo
//
//  Created by Alexander on 02.02.2021.
//

import Foundation


// MARK: - Event
struct Event: Codable {
    let success: Bool
    let data: UserDataModel
}

// MARK: - DataClass
struct UserDataModel: Codable {
    let uid: Int
    let name, email, accessToken: String
    let role, status, createdAt, updatedAt: Int

    enum CodingKeys: String, CodingKey {
        case uid, name, email
        case accessToken = "access_token"
        case role, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct LoginModel: Codable {
    let email: String
    let password: String
}

struct SignupModel: Codable {
    let name: String
    let email: String
    let password: String
}
