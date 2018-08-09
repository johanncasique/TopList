//
//  UseCaseProtocol.swift
//  TopChartStore
//
//  Created by Casique, Johan on 09/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol TopAppsUseCaseProtocol {
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler)
}

protocol TopAppsUseCaseImplementationProtocol: TopAppsUseCaseProtocol {
    var appsGateway: ApiAppsGateway { get }
    var country: String { get }
}
