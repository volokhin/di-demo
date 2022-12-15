// Delo © 2GIS

import Foundation

/// Абстракция "сборки", позволяющая зарегистрировать группу зависимостей в контейнере
/// - Note: Используется для разделения зависимостей на логические группы, например,
/// для регистрации зависимостей модуля
public protocol IAssembly {

    /// Регистрирует зависимости в контейнере
    /// - Parameter container: Экземпляр контейнера
    func registerDependencies(container: IContainer)
}
