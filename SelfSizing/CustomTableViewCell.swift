//
//  CustomTableViewCell.swift
//  SelfSizing
//
//  Created by Bair Nadtsalov on 13.05.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile")
        view.contentMode = .top
        view.setContentHuggingPriority(.required, for: .horizontal)
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, messageLabel])
        stack.axis = .vertical
        stack.spacing = UIStackView.spacingUseSystem
        stack.distribution = .fill
        stack.alignment = .fill
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImageView, vStackView])
        stack.spacing = UIStackView.spacingUseSystem
        stack.distribution = .fill
        stack.alignment = .fill
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(hStackView)
        
        let margins = contentView.readableContentGuide
        
        NSLayoutConstraint.activate([
            
            margins.topAnchor.constraint(equalTo: hStackView.topAnchor),
            margins.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            margins.leadingAnchor.constraint(equalTo: hStackView.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: hStackView.trailingAnchor)
        ])
    }
    
    func configureProfile(name: String, message: String) {
        nameLabel.text = name
        messageLabel.text = message
        
    }

}
