//
//  AuthManager.swift
//  FloridaGems
//
//  Created by Daniel Loshkarev on 8/22/22.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    //MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        // check if username is available
        // check if email is available
        // create new account
        // insert new account into database
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                // create new account
                // insert new account into database
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // firebase auth could not create account
                        completion(false)
                        return
                    }
                    
                    // insert into database
                    
                }
            }
            else {
                // username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email login
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
            
    }
        else if let username = username {
            // username login
            print(username)
        }
    }
}
