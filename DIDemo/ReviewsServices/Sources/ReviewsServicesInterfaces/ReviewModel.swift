import Foundation

public struct ReviewModel: Equatable {

	public let id: String
	public let text: String

	public init(id: String, text: String) {
		self.id = id
		self.text = text
	}
}
