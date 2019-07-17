//
//  TasksViewModel.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import Foundation

class TasksViewModel {
    
    let session: URLSession!
    let url = URL(string: "https://baconipsum.com/api/?type=meat-and-filler&paras=5&format=text")!
    
    var aboutInfoObserver: ((String) -> ())?
    var isLoadingDataObserver: ((Bool) -> ())?
    var errorObserver: ((String) -> ())?
    var userDefault: UserDefaults!
    
    init(urlsession: URLSession, userDefault: UserDefaults) {
        session = urlsession
        self.userDefault = userDefault
    }
    
    func getAboutData() {
        isLoadingDataObserver?(true)
        let task = session.dataTask(with: url, completionHandler: { [unowned self] data, response, error in
            DispatchQueue.main.async {
                self.isLoadingDataObserver?(false)
            }
            if error == nil {
                DispatchQueue.main.async {
                    self.aboutInfoObserver?(String(data: data!, encoding: .utf8) ?? "N/A")
                }
            } else {
               //test the code is executed in main thread
                self.errorObserver?(error!.localizedDescription)
            }
        })
        task.resume()
    }
    
    func save(toDoList: [TaskModel]) {
        userDefault.setValue(NSKeyedArchiver.archivedData(withRootObject: toDoList),
                             forKey: AppConstants.UserDefaultKeys.toDoList)
    }
    
    func syncToDoList() {
        //yet to be implemented
    }
    
}
