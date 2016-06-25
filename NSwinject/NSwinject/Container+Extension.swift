//
//  Container+Extension.swift
//  NSwinject
//
//  Created by Nghia Nguyen on 6/25/16.
//  Copyright © 2016 Nghia Nguyen. All rights reserved.
//

import Swinject


public extension Container {
    public func register<T>(name: String? = nil, factory: () -> T) -> Void {
        self.register(T.self, name: name) { (_) -> T in
            return factory()
        }
    }
    
    public func register<T, A>(name: String? = nil, factory: (A) -> T) -> Void {
        self.register(T.self, name: name) { (_, a) -> T in
            return factory(a)
        }
    }
    
    public func register<T, A, B>(name: String? = nil, factory: (A, B) -> T) -> Void {
        self.register(T.self, name: name) { (_, a, b) -> T in
            return factory(a, b)
        }
    }
    
    public func register<T, A, B, C>(name: String? = nil, factory: (A, B, C) -> T) -> Void {
        self.register(T.self, name: name) { (_, a, b, c) -> T in
            return factory(a, b, c)
        }
    }
    
    public func register<T, A, B, C, D>(name: String? = nil, factory: (A, B, C, D) -> T) -> Void {
        self.register(T.self, name: name) { (_, a, b, c, d) -> T in
            return factory(a, b, c, d)
        }
    }
    
    public func register<T, A, B, C, D, E>(name: String? = nil, factory: (A, B, C, D, E) -> T) -> Void {
        self.register(T.self, name: name) { (_, a, b, c, d, e) -> T in
            return factory(a, b, c, d, e)
            
        }
    }
}