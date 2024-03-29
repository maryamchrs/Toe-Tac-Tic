//
//  UserDefaults+Extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation

private enum UserDefaultsKey: String {
    case isFirstOpen = "is_first_open"
}

extension UserDefaults {
    
    var isFirstOpen: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultsKey.isFirstOpen.rawValue)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultsKey.isFirstOpen.rawValue)
        }
    }
   
}

private extension UserDefaults {
    func setObject<Object>(_ object: Object, forKey key: String) where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: key)
        } catch let encodeErr {
            CustomLogger.log(text: "Failed to encode object: \(encodeErr)")
        }
    }
        
    func getObject<Object>(forKey key: String, castTo type: Object.Type) -> Object? where Object: Decodable {
        guard let data = data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch let decodeError {
            CustomLogger.log(text: "Failed to decode object: \(decodeError)")
            return nil
        }
    }
}

