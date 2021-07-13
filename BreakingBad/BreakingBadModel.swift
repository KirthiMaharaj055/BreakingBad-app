//
//  BreakingBadModel.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/07/11.
//

import Foundation

class BreakingBadModel {
     
  private  var breakingBadQuote = [QuoteDetail]()
  private  let breakingBadProvider = BreakingBadProvider()
    
    fileprivate func getQuote() {
         breakingBadProvider.fetchBreakBadQuotesApi { result in
             switch result {
                 case .success(let quote):
                     print(quote)
                    DispatchQueue.main.async {
                        self.breakingBadQuote = quote
                        
                    }
                 case .failure(let error):
                     print(error)
             }
         }
     }
}
