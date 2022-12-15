import AppContainer
import ReviewsServices

/// Регистрирует все зависимости приложения
public struct MainAssembly: IAssembly {

	public init() {}

	public func registerDependencies(container: IContainer) {
		Assembler.shared.register([
			ReviewsServicesAssembly()
			// сборки других модулей приложения регистриуем ниже
			// ...
		])
	}
}
