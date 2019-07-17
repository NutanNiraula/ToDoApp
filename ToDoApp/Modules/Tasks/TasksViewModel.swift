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
    
    init(urlsession: URLSession) {
        session = urlsession
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
    
    func syncToDoList(list: [TaskModel]) {
        //yet to be implemented
    }
    
}
