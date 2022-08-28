//
//  DatabaseManager.swift
//  FloridaGems
//
//  Created by Daniel Loshkarev on 8/22/22.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: - Public
    
    // Check if username and email is available
    // - Parameters
    //      -email: String representing email
    //      -username: String representing username
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        
    }
    
    /// inserts new data into database
    // - Parameters
    //      -email: String representing email
    //      -username: String representing username
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeded
                completion(true)
            }
            else {
                // failed
                completion(false)
            }
        }
    }
}
