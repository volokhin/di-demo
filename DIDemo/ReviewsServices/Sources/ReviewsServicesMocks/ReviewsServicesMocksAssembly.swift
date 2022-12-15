import AppContainer
import ReviewsServicesInterfaces

/// Регистрирует все зависимости модуля для тестов
public struct ReviewsServicesMocksAssembly: IAssembly {

	public init() {}
	
	public func registerDependencies(container: IContainer) {
		container.register(IReviewsService.self) { ReviewsServiceMock() }
		// другие моки модуля регистрируем ниже
		// ...
	}
}
