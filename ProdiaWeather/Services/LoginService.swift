//
//  LoginService.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 26/05/22.
//

import Foundation

class LoginService {
    static let shared = LoginService()

    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
