//
//  LocationView.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
protocol LocationViewProtocol: class {
    var presenter: LocationPresenter! {get set}
}

protocol LocationPresenterProtocol: class {
    var view: LocationViewProtocol? { get set }
}

protocol LocationRouterProtocol {
    func dismiss()
}
