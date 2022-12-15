import AppContainer
import ReviewsServicesInterfaces

/// Регистрирует все зависимости модуля для прода
public struct ReviewsServicesAssembly: IAssembly {

	public init() {}

	public func registerDependencies(container: IContainer) {
		container.register(IReviewsService.self) { ReviewsService() }
		// другие сервисы модуля регистрируем ниже
		// ...
	}
}
