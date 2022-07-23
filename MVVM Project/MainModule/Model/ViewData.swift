//
//  ViewData.swift
//  MVVM Project
//
//  Created by Pavlov Matvey on 23.07.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
    }
}
