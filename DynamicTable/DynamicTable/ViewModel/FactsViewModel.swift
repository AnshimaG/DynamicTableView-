//
//  FactsViewModel.swift
//  DynamicTable
//
//  Created by Ankita  on 17/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import Foundation

/// Protocol added to pass data from ViewModel to Controller class
protocol DataFetchProtocol: class {
  func onDataFetchSuccessfullyCompleted(with result: FactModel)
  func onDataFetchFailed(with reason: String)
}
class FactsViewModel  {
    
    weak var delegate: DataFetchProtocol?
    
    init(delegate: DataFetchProtocol) {
      self.delegate = delegate
    }
    
    /// This method  called calls the api func available in ApiClient class  to fetch data data from api and binds it back to controller class
    func getFactsData()  {
        ApiClient().fetchData(url: ApiEndPoints.factApiUrl) { [weak self](response:Result<FactModel,NetworkError>) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response{
                   case .success(let factsList):
                        print(factsList)
                        self.delegate?.onDataFetchSuccessfullyCompleted(with: factsList)
                    case .failure(let err):
                        print(err)
                        self.delegate?.onDataFetchFailed(with: err.localizedDescription)
                   }
            }

           }}


    }
   
