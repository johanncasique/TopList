//
//  PaidAppStorePresenter.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol PaidAppView: class {
    var dataSource: TableDataSource<FreeAppTableViewCell, App>? { get set }
}

protocol PaidAppPresenter {
    var router: PaidAppRouter { get }
    func viewDidLoad()
    func didSelected(atRow row: Int)
}

class PaidAppPresenterImplementation: PaidAppPresenter, DataSourceDelegate {
    
    fileprivate weak var view: PaidAppView?
    fileprivate let displayAppUseCase: TopAppsUseCaseProtocol
    internal let router: PaidAppRouter
    
    var items: [App]?
    
    init(view: PaidAppView, useCase: TopAppsUseCaseProtocol, router: PaidAppRouter) {
        self.view = view
        self.displayAppUseCase = useCase
        self.router = router
    }
    
    func viewDidLoad() {
        displayAppUseCase.getApps { result in
            switch result {
            case let .success(apps):
                self.handleApps(apps)
            case let .failure(error):
                print(error)
            }
        }
    }

    func didSelected(atRow row: Int) {
        
    }
    
    
    // MARK: - Privates
    private func handleApps(_ apps: ApiApps) {
        guard let app = apps.result else { return }
        self.items = app
        view?.dataSource = TableDataSource<FreeAppTableViewCell, App>(array: app, delegate: self)
    }
    
    func rowDidSelected(at index: Int) {
        //guard let items = items else { return }
        //router.showDetail(for: items[index])
    }
    
}
