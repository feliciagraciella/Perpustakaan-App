//
//  AppState.swift
//  cobasertif
//
//  Created by Felicia Graciella on 04/01/24.
//

import Foundation

enum Route {
    case transaction
    case product
}

class AppState: ObservableObject{
    @Published var routes: [Route] = [.transaction]
    
    var currentRoute: Route? {
        routes.last
    }
    
    func push(_ route: Route) {
        routes.append(route)
    }
    
    @discardableResult
    func pop() -> Route? {
        routes.popLast()
    }
}
