//
//  App+Injection.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
      register { UIDataService() }.implements(UIDataProtocol.self)
  }
}
