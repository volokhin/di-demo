// Delo © 2GIS

import Foundation

/// Сборщик, который умеет регистрировать зависимости экземпляров `IAssembly` в контейнере
public final class Assembler {

    /// Глобальный экземпляр сборщика
    public static let shared = Assembler()

    private let container: IContainer

    private init() {
        self.container = Container.shared
    }

    /// Регистрирует зависимости экземпляра `IAssembly` в контейнере
    /// - Parameter assembly: Экземпляр `IAssembly`
    /// - Note: This method is not thread-safe
    public func register(_ assembly: IAssembly) {
		assembly.registerDependencies(container: container)
    }
}

// MARK: - Assembler

extension Assembler {
    /// Регистрирует зависимости экземпляров `IAssembly` в контейнере
    /// - Parameter assembly: Экземпляры `IAssembly`
    /// - Note: This method is not thread-safe
    public func register(_ assemblies: [IAssembly]) {
        assemblies.forEach(register)
    }
}
