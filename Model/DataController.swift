//
//  DataController.swift
//  Mooskine
//
//  Created by mahmoud mohamed on 4/29/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let container:NSPersistentContainer
    var context:NSManagedObjectContext{
        return container.viewContext
    }
    
    init(modelName:String) {
        container=NSPersistentContainer(name: modelName)
    }
    
    func loadStore(completionHandler:(()->Void)?=nil){
        container.loadPersistentStores { (description, error) in
            if error != nil{
                fatalError(error!.localizedDescription)
            }
           self.autoSave()
        }
    }
    
    func autoSave(_ timeInterval:TimeInterval=30){
        print("autosaving")
        if timeInterval > 0 {
            if self.context.hasChanges{
                try! self.context.save()
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+timeInterval) {
                self.autoSave(timeInterval)
            }
        }
    }
}
