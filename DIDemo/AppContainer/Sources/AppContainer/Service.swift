// Delo © 2GIS

import Foundation

/// Property wrapper, предназначенный для извлечения singleton зависимостей из контейнера
/// - Note: Зависимость извлекается из контейнера лениво, в момент обращения
@propertyWrapper public struct Service<T> {

    private weak var instance: AnyObject?
    public init() { }

    public var wrappedValue: T {
        mutating get {
            if let instance = instance as? T {
                return instance
            }
            let resolved: T = Container.shared.resolve()
            instance = resolved as AnyObject
            return resolved
        }
    }
}
