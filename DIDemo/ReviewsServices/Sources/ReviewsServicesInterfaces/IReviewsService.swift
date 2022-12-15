import Foundation

/// Сервис, который ходит на бэкенд отзывов за отзывами
public protocol IReviewsService {
	func fetchReviews(cardId: String) async throws -> [ReviewModel]
}
