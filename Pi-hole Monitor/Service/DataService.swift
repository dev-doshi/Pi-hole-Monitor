//
//  DataService.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 14.06.23.
//

import Foundation

class DataService {
    
    func setStatus(apiURL: String) {
        if let url = URL(string: apiURL) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    // Handle the error appropriately
                    print("Error: \(error)")
                    return
                }
                
                if let statusData = data {
                    do {
                        let decoder = JSONDecoder()
                        let rData = try decoder.decode(Status.self, from: statusData)
                        // Use the decoded `rData` as needed
                    } catch {
                        // Handle the decoding error appropriately
                        print("Decoding error: \(error)")
                    }
                }
            }.resume()
        }
    }

    
    func getSummary(apiURL: String, completion: @escaping (Summary?, Error?) -> Void) {
        if let url = URL(string: apiURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let summaryData = data else {
                    completion(nil, nil) // Or provide an appropriate error indicator
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let rData = try decoder.decode(Summary.self, from: summaryData)
                    completion(rData, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
        }
    }

}
