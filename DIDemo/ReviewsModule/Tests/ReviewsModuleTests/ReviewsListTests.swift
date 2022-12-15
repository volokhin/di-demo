import XCTest
import AppContainer
import ReviewsServicesMocks
import ReviewsServicesInterfaces
@testable import ReviewsModule

@MainActor final class ReviewsListTests: XCTestCase {

	override func setUp() {
		// для тестов регистрируем моки нужных нам зависимостей
		Assembler.shared.register([
			ReviewsServicesMocksAssembly()
		])
	}

	func testReviewsList() async {
		// при создании VM не нужно пробрасывать зависимости, только аргументы
		let vm = ReviewsListVM(args: ReviewsListVM.Args(cardId: "42"))
		await vm.willAppear()
		XCTAssertEqual(
			vm.state,
			.success([
				ReviewModel(id: "1", text: "Тестовый отзыв для карточки 42")
			])
		)
	}
}
