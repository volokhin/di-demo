import Foundation
import AppContainer
import ReviewsServicesInterfaces

/// VM для отображения отзывов
@MainActor public class ReviewsListVM {

	@Service private var reviewsService: IReviewsService
	// другие сервисы от которых зависит VM объявляем ниже
	// ...

	var viewModelChanged: (() -> Void)?

	private(set) var state: State = .loading {
		didSet {
			viewModelChanged?()
		}
	}

	private let args: Args

	// в ините больше нет зависимостей, остаются только аргументы
	public init(args: Args) {
		self.args = args
	}

	func willAppear() async {
		do {
			state = .loading
			let reviews = try await reviewsService.fetchReviews(cardId: args.cardId)
			state = .success(reviews)
		} catch {
			state = .error
		}
	}
}

// MARK: - Args

extension ReviewsListVM {
	public struct Args {
		public let cardId: String
		public init(cardId: String) {
			self.cardId = cardId
		}
	}
}

// MARK: - State

extension ReviewsListVM {
	public enum State: Equatable {
		case loading
		case success([ReviewModel])
		case error
	}
}
