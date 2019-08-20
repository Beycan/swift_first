//
//  LocationModel.swift
//  swift_database
//
//  Created by sistemas005 on 20/08/19.
//  Copyright © 2019 Beagle. All rights reserved.
//

import Foundation

class LocationModel: NSObject {
    var id:String?
    var name:String?
    var lastname:String?
    
    //empty constructor
    override init() {
        
    }
    
    init(id:String,name:String,lastname:String) {
        self.id=id
        self.name=name
        self.lastname=lastname
        
    }
    override var description: String{
        return "Id:\(id),Name:\(name),Lastname:\(lastname)"
    }
    

}
