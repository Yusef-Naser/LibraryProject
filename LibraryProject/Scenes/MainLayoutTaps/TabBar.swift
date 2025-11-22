import UIKit

enum TabItem: Int, CaseIterable {
    case home = 0
    case favourite = 1
   // case library = 2
    case more = 3
    
    var icon: String {
        switch self {
        case .home:
            return "Path 2"
        case .favourite:
            return "Path 37"
//        case .library:
//            return "book"
        case .more:
            return "Path 4"
        }
    }
    
    var selectedIcon: String {
        switch self {
        case .home:
            return "Path 33"
        case .favourite:
            return "Path 3"
//        case .library:
//            return "book.fill"
        case .more:
            return "Path 5"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return SString.home
        case .favourite:
            return SString.favorite
//        case .library:
//            return "My Library"
        case .more:
            return SString.more
        }
    }
}

protocol TabBarDelegate: AnyObject {
    func tabBar(_ tabBar: TabBar, didSelectTabAt index: Int)
}

class TabBar: UIView {
    
    weak var delegate: TabBarDelegate?
    
    var selectedIndex: Int = 1 {
        didSet {
            updateSelection()
        }
    }
    
    private var tabButtons: [TabButton] = []
    private let indicatorView = UIImageView(image: UIImage(named: "indicatorView"))
    private let stackView = UIStackView()
    
    private let lineView : UIView = {
        let l = UIView()
        l.backgroundColor = Colors.colorBorder
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar()
    }
    
    private func setupTabBar() {
        backgroundColor = .white
        
        // Setup stack view
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        // Create tab buttons
        for (index, item) in TabItem.allCases.enumerated() {
            let button = TabButton(item: item, index: index)
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            tabButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        addSubview(lineView)
        lineView.anchor(top: self.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , height: 2)
        
        // Setup indicator view
        indicatorView.frame = CGRect(x: 0, y: 0, width: 50, height: 8)
        addSubview(indicatorView)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
        // Initial selection
        updateSelection()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition()
    }
    
    @objc private func tabButtonTapped(_ sender: TabButton) {
        let newIndex = sender.index
        guard newIndex != selectedIndex else { return }
        
        selectedIndex = newIndex
        delegate?.tabBar(self, didSelectTabAt: newIndex)
    }
    
    private func updateSelection() {
        for (index, button) in tabButtons.enumerated() {
            button.isSelected = (index == selectedIndex)
        }
        updateIndicatorPosition()
    }
    
    private func updateIndicatorPosition() {
        guard tabButtons.count > 0, bounds.width > 0 else { return }
        
        let tabWidth = bounds.width / CGFloat(tabButtons.count)
        var indicatorX = CGFloat(selectedIndex) * tabWidth + tabWidth / 2
        
        let isRTL = UIView.userInterfaceLayoutDirection(
            for: self.semanticContentAttribute ) == .rightToLeft
        if isRTL {
            indicatorX = UIScreen.main.bounds.width - indicatorX
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.indicatorView.center = CGPoint(x: indicatorX, y: 4) // Position at top with 4pt offset
        }
        delegate?.tabBar(self, didSelectTabAt: selectedIndex)
    }
}

class TabButton: UIButton {
    let item: TabItem
    let index: Int
    
    private let iconImageView = UIImageView()
    private let label = UILabel()
    
    var isTabSelected: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    
    init(item: TabItem, index: Int) {
        self.item = item
        self.index = index
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        // Setup icon image view
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        
        // Setup title label
        label.text = item.title
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            label.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
        ])
        
        updateAppearance()
    }
    
    private func updateAppearance() {
        let iconName = isTabSelected ? item.selectedIcon : item.icon
        let iconColor = isTabSelected ? UIColor.gray.withAlphaComponent(0.8) : UIColor.gray.withAlphaComponent(0.4)
        let textColor = isTabSelected ? UIColor.gray.withAlphaComponent(0.8) : UIColor.gray.withAlphaComponent(0.4)
        
        iconImageView.image = UIImage(named: iconName)
        iconImageView.tintColor = iconColor
        label.textColor = textColor
        
        UIView.animate(withDuration: 0.2) {
            self.iconImageView.alpha = 1.0
            self.label.alpha = 1.0
        }
    }
    
    override var isSelected: Bool {
        didSet {
            isTabSelected = isSelected
        }
    }
}

class TriangleIndicatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let color = UIColor.gray.withAlphaComponent(0.8)
        context.setFillColor(color.cgColor)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.close()
        
        context.addPath(path.cgPath)
        context.fillPath()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Frame is set by parent, just redraw
        setNeedsDisplay()
    }
}
