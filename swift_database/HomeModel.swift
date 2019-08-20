//
//  HomeModel.swift
//  swift_database
//
//  Created by sistemas005 on 20/08/19.
//  Copyright © 2019 Beagle. All rights reserved.
//
import UIKit
import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delega: HomeModelProtocol!
    var data=Data()
    let urlPath:String="http://localhost:8888/test_bei/service.php"
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
}

func parseJSON(_ data:Data){
    var jsonResult = NSArray()
    
    do{
        jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
    
    } catch let error as NSError {
            print(error)
    }
    
    var jsonElement = NSDictionary()
    let locations = NSMutableArray()

    for i in 0 ..< jsonResult.count
    {

        jsonElement = jsonResult[i] as! NSDictionary

        let persona = LocationModel()

        //the following insures none of the JsonElement values are nil through optional binding
        if let id = jsonElement["id"] as? String,
            let name = jsonElement["name"] as? String,
            let lastname = jsonElement["lastname"] as? String
        {

            persona.id = name
            persona.name = name
            persona.lastname = lastname

        }

        locations.add(persona)

    }
    
  print(locations)
    
//    hasta aqui ya està
//    DispatchQueue.main.async(execute: {
//        () -> Void in self.delega.itemsDownloaded(items: locations)
//    })
}

