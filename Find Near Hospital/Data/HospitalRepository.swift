//
//  HospitalRepository.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 13/07/21.
//

import Foundation


class HospitalRepository {
    
    var hospitals:[Hospital] = []
    
    static var favoriteHospitals:[Hospital]=[]

    
    init() {
        if let localData = self.readLocalFile(forName: "hospitals") {
            self.parse(jsonData: localData)
        }
    }
    
    func getHospitals()->[Hospital]{
        return hospitals
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([Hospital].self,
                                                       from: jsonData)
            hospitals = decodedData
        } catch {
            print("decode error\(error)")
        }
    }
    
    
}
