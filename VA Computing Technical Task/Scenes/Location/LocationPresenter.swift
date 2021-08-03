//
//  LocationPresenter.swift
//  VA Computing Technical Task
//
//  Created by Admin1 on 02/08/2021.
//  Copyright © 2021 Admin1. All rights reserved.
//

import Foundation
class LocationPresenter: LocationPresenterProtocol {
    weak var view: LocationViewProtocol?
    private let router: LocationRouterProtocol


    init(view: LocationViewProtocol, router: LocationRouterProtocol) {
        self.view = view
        self.router = router
    }
}
