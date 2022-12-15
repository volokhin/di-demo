import UIKit
import ReviewsModule

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = scene as? UIWindowScene else { return }

		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = ReviewsListVC(
			viewModel: ReviewsListVM(
				args: ReviewsListVM.Args(cardId: "42")
			)
		)
		self.window = window
		window.makeKeyAndVisible()
	}
}
