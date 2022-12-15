import UIKit

/// VC для отображения отзывов
public class ReviewsListVC: UIViewController {

	private lazy var label = UILabel()
	private let viewModel: ReviewsListVM

	public init(viewModel: ReviewsListVM) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)

		viewModel.viewModelChanged = { [weak self] in
			self?.viewModelChanged()
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = .systemBackground
		label.numberOfLines = 0
		self.view.addSubview(label)
	}
	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		Task { await viewModel.willAppear() }
	}

	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		label.frame = view.bounds.insetBy(dx: 16, dy: 16)
	}

	func viewModelChanged() {
		switch viewModel.state {
			case .loading:
				label.text = "Loading..."
			case .success(let reviews):
				label.text = "\(reviews)"
			case .error:
				label.text = "Error!"
		}
	}
}
