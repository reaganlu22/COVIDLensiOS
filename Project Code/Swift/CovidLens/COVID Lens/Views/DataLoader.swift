//
//  DataLoader.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/19/20.
//

import Foundation

public class DataLoader {
    var resHalls = [residenceHall]()
    
    /**
     This function parses a .json file
     - Returns: array of residenceHall objects
     */
    func readJSON() -> [residenceHall] {
        if let path = Bundle.main.url(forResource: "residenceHalls", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let dataFromJson = try JSONDecoder().decode([residenceHall].self, from: data)
                self.resHalls = dataFromJson
            }
            catch {
                print(error)
            }
        }
        return self.resHalls
    }
}
