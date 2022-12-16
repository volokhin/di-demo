// Delo © 2GIS

import Foundation

// MARK: - AnyResolvable

private struct AnyResolvable {
    private let factory: () -> Any

    init(factory: @escaping () -> Any) {
        self.factory = factory
    }

    func resolve() -> Any {
        factory()
    }
}

// MARK: - Container

public protocol IContainer: AnyObject {

    /// Регистрирует singleton зависимость в контейнере на основе фабрики
    /// - Parameters:
    ///   - protocol: Протокол
    ///   - factory: Фабрика
    func register<Protocol>(_ protocol: Protocol.Type, factory: @escaping () -> Protocol)

    /// Переопределяет регистрацию singleton зависимости в контейнере на основе фабрики
    /// - Parameters:
    ///   - protocol: Протокол
    ///   - factory: Фабрика
    func replace<Protocol>(_ protocol: Protocol.Type, factory: @escaping () -> Protocol)

    /// Очищает список всех регистраций
    func unregisterAll()

    /// Извлекает зависимость из контейнера. Каждый раз будет возвращаться один и тот же экземпляр объекта
    func resolve<T>() -> T
}

final class Container {
    static let shared: IContainer = Container()
    private let queue = DispatchQueue(label: "Container Queue")
    private var registrations: [ObjectIdentifier: AnyResolvable] = [:]
    private var singletons: [ObjectIdentifier: AnyObject] = [:]
    private init() { }
}

// MARK: - IContainer

extension Container: IContainer {

    func register<Protocol>(_ protocol: Protocol.Type, factory: @escaping () -> Protocol) {
        queue.sync {
            let key = ObjectIdentifier(`protocol`)
            let value = AnyResolvable(factory: factory)
            registrations[key] = value
        }
    }

    func replace<Protocol>(_ protocol: Protocol.Type, factory: @escaping () -> Protocol) {
        queue.sync {
            let key = ObjectIdentifier(`protocol`)
            let value = AnyResolvable(factory: factory)
            registrations[key] = value
        }
    }

    func unregisterAll() {
        queue.sync {
            registrations.removeAll()
            singletons.removeAll()
        }
    }

    func resolve<T>() -> T {
        let key = ObjectIdentifier(T.self)
        if let cached: T = cachedInstance(forKey: key) {
            return cached
        } else if let resolvable = registration(forKey: key), let instance = resolvable.resolve() as? T {
            cacheInstance(instance as AnyObject, forKey: key)
            return instance
        } else {
			fatalError("Service \(T.self) is not registered in the Container")
        }
    }
}

// MARK: - Private

private extension Container {

    func registration(forKey key: ObjectIdentifier) -> AnyResolvable? {
        queue.sync {
            return registrations[key]
        }
    }

    func cachedInstance<T>(forKey key: ObjectIdentifier) -> T? {
        queue.sync {
            return singletons[key] as? T
        }
    }

    func cacheInstance(_ instance: AnyObject, forKey key: ObjectIdentifier) {
        queue.sync {
            singletons[key] = instance
        }
    }
}
