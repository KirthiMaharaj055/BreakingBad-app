//
//  BreakingBadProvider.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/07/01.
//

import Foundation

enum BreakingBadError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct  BreakingBadProvider {
    
    func fetchBreakingBadAPI(completion: @escaping (Result<[CharacterDetail], BreakingBadError>) -> Void){
        let url = URL(string: "https://www.breakingbadapi.com/api/characters")!
        let sharedSession = URLSession.shared
        let request = URLRequest(url: url)
        let task = sharedSession.dataTask(with: request) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let BDecoder = JSONDecoder()
                let charactersData = try BDecoder.decode([CharacterDetail].self, from: jsonData)
                let characterDetail = charactersData.self             //   let characterStatu = charactersData.status.rawValue
                completion(.success(characterDetail))
               // completion(charactersData)
            } catch {
              //  let error = error
              //  print(error.localizedDescription)
                completion(.failure(.canNotProcessData))
            }
        }
        task.resume()
    }
    
    func fetchBreakBadQuotesApi(completion: @escaping (Result<[QuoteDetail], BreakingBadError>) -> Void){
        let urls = URL(string: "https://www.breakingbadapi.com/api/quotes")!
        let sharedSessions = URLSession.shared
        let requests = URLRequest(url: urls)
        let taskData = sharedSessions.dataTask(with: requests) { data, _, _ in
            guard let data = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let Decoder = JSONDecoder()
                let quoteData = try Decoder.decode([QuoteDetail].self, from: data)
    
                print(quoteData)
                completion(.success(quoteData))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        taskData.resume()
    }
}









/*
        if let data = data {
            if let characters = try? JSONDecoder().decode([Character].self, from: data) {
                completionHandler(characters)
            } else {
                print("Invalid Response")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
        guard let unwrappedData = data else {
            print("No data")
            return
        }
        do {
            let jsonDecoder = JSONDecoder()
            let characterList = try jsonDecoder.decode([Character].self, from: unwrappedData)
                completionHandler(characterList)
        }catch {
            print("Could not decode")
        }
 */
