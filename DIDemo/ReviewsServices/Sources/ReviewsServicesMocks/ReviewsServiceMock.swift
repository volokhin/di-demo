import Foundation
import ReviewsServicesInterfaces

/// Тестовый сервис отзывов
public class ReviewsServiceMock: IReviewsService {

	public func fetchReviews(cardId: String) async throws -> [ReviewModel] {
		[ReviewModel(id: "1", text: "Тестовый отзыв для карточки \(cardId)")]
	}
}
