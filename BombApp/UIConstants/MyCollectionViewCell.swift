import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCell"

    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .yellowColor
        label.font = UIFont.delaGothicOneRegular16()
        label.textAlignment = .center
        label.textColor = .yellowColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image?.withConfiguration(configuration), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(selectButton)

        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            myImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),

            myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with image: UIImage, title: String) {
        myImageView.image = image
        myLabel.text = title
    }
}
