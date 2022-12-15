import Foundation
import ReviewsServicesInterfaces

/// Боевой сервис отзывов
public class ReviewsService: IReviewsService {

	public func fetchReviews(cardId: String) async throws -> [ReviewModel] {
		try await Task.sleep(nanoseconds: 3_000_000_000)
		return [
			ReviewModel(id: "1", text: "Боевой отзыв для карточки \(cardId)")
		]
	}
}
