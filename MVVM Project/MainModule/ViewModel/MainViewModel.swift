//
//  MainViewModel.swift
//  MVVM Project
//
//  Created by Pavlov Matvey on 23.07.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        self.updateViewData?(.loading(ViewData.Data(icon: nil, title: nil, description: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "Success", title: "Success", description: "Done")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "Failure", title: "Error", description: "Nothing done")))
        }
    }
}
