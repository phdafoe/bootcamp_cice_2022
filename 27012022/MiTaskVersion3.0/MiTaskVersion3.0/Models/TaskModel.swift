//
//  TaskModel.swift
//  App_TaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 10/6/21.
//  Copyright © 2021 Cice. All rights reserved.
//

import Foundation

struct DownloadNewModel: Codable, Equatable, Identifiable {

    let id: Int
    let newTask: String
    let priority: String?
    let taskDate: String?
    let taskDescription: String?
    let taskCategory: String?
    let taskImage: Data?
    
    
    init(pId: Int, pNewTask: String, pPriority: String, pTaskDate: String, pTaskDescription: String, pTaskCategory: String, pTaskImage: Data) {
        self.id = pId
        self.newTask = pNewTask
        self.priority = pPriority
        self.taskDate = pTaskDate
        self.taskDescription = pTaskDescription
        self.taskCategory = pTaskCategory
        self.taskImage = pTaskImage
    }
    
    static func == (lhs: DownloadNewModel, rhs: DownloadNewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

class DownloadNewModels: Codable, Identifiable {
    
    var downloads: [DownloadNewModel]?
    var description: String {
        return "\(downloads.map({$0.description}) ?? "")"
    }
    init() {
        self.downloads = []
    }
}


class SaveFavoritesPresenter: NSObject {
    
    static let shared = SaveFavoritesPresenter()
    var key: String = "task"
    
    var arrayLocalDownloads: DownloadNewModels?
    

    func addLocal(favorite: DownloadNewModel, success: @escaping(DownloadNewModel?) -> Void, failure: @escaping(String?) -> Void) {
        
        self.getAllLocal(success: { (favorites) in
            if let favoritesDes = favorites {
                if let fav = favoritesDes.downloads?.first( where: { $0 == favorite }) {
                    success(fav)
                } else {
                    favoritesDes.downloads?.append(favorite)
                    self.setLocal(favorites: favorites)
                    success(favorite)
                }
            } else {
                let favorites = DownloadNewModels()
                favorites.downloads?.append(favorite)
                self.setLocal(favorites: favorites)
                success(favorite)
            }
        }) { (error) in
            failure(error)
        }
    }
    
    func deleteLocal(favorite: DownloadNewModel?, success: @escaping (DownloadNewModels?) -> Void, failure: @escaping(String?) -> Void) {
        
        // Delete One
        if let favorite = favorite {
            self.getAllLocal(success: { (favorites) in
                favorites?.downloads = favorites?.downloads?.filter({ $0 != favorite })
                self.updateLocal(favorites: favorites)
                success(favorites)
            }) { (error) in
                failure(error)
            }
        } else {
            // Delete All
            UserDefaultCustom.shared.remove(for: self.key)
            self.getAllLocal(success: { (favorites) in
                success(favorites)
            }) { (error) in
                failure(error)
            }
        }
    }
    
    func delete(favorite: DownloadNewModel?, success: @escaping (DownloadNewModels?) -> Void, failure: @escaping(String?) -> Void) {
            self.deleteLocal(favorite: favorite,
                              success: { (favorites) in
                                success(favorites)
            }) { (error) in
                failure(error)
            }
    }
    
    func getAllLocal(success: @escaping(DownloadNewModels?) -> Void, failure : @escaping(String?) -> Void) {
        if let data = UserDefaults.standard.value(forKey: self.key) as? Data {
            let favs = try? JSONDecoder().decode(DownloadNewModels.self, from: data)
            success(favs)
            return
        }
        success(nil)
    }
         
   
    private func updateLocal(favorites: DownloadNewModels?) {
        UserDefaultCustom.shared.set(value: try? JSONEncoder().encode(favorites), key: self.key)
    }
    

    private func setLocal(favorites: DownloadNewModels?) {
        do {
            UserDefaultCustom.shared.set(value: try JSONEncoder().encode(favorites), key: self.key)
        } catch {
            print(error)
        }
    }
    
    func backResults() -> DownloadNewModels{
        var aux : DownloadNewModels?
        self.getAllLocal { (results) in
            if results != nil {
                aux = results!
            } else {
                
            }
        } failure: { (error) in
            print(error ?? "")
        }
        guard let auxDes = aux else { return DownloadNewModels() }
        return auxDes
    }
}

class UserDefaultCustom {

    static let shared = UserDefaultCustom()

    func set(value: Any?, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }

    func remove(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }

    func value(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
}
