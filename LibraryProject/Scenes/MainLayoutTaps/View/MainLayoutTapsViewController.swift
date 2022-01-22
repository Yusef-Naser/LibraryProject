import UIKit


class MainLayoutTapsViewController: UITabBarController{
    
    @IBOutlet weak var customizedTabBar: CustomizedTabBar!
    
    let tabBarSafeAreaHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
    var home = UINavigationController(rootViewController: HomeVC())
    var setting  = UINavigationController(rootViewController: HomeVC())
    var favourite = UINavigationController(rootViewController: HomeVC())
    
    var roundCircleview: CircleView = {
       let view = CircleView()
        view.layer.cornerRadius = 35
        view.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.7215686275, blue: 0.06666666667, alpha: 1)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    var labelVersion: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarItems()
        addSubViews()
        roundCircleview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popToMainView)))
    }
    
    @objc private func popToMainView(){
        handleClickOnSelectedTabBarItem()
    }
    
    private func addSubViews() {
        
        self.view.addSubview(labelVersion)
        labelVersion.anchor(bottom:view.bottomAnchor, centerX: view.centerXAnchor, paddingBottom: tabBarSafeAreaHeight == 0 ? 5 : 15)
        
        self.view.addSubview(roundCircleview)
        roundCircleview.frame = CGRect(x: customizedTabBar.frame.midX - 35, y: customizedTabBar.frame.origin.y - 40  , width: 70, height: 70)
        
    }
    
    private func handleClickOnSelectedTabBarItem(){
        if selectedIndex == 0 {
            popToRootVC(view: favourite)
        }else if selectedIndex == 1 {
            popToRootVC(view: home)
        }else {
            popToRootVC(view: setting)
        }
    }
    
    private func popToRootVC(view: UINavigationController) {
        view.popToRootViewController(animated: true)
    }
    
    private func createTabBarItems() {
        self.delegate = self
        self.tabBar.tintColor = #colorLiteral(red: 0.7921568627, green: 0.7215686275, blue: 0.06666666667, alpha: 1)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -18)
        
        home.tabBarItem = UITabBarItem(title: NSLocalizedString("home", comment: ""), image:#imageLiteral(resourceName: "Path 2"), selectedImage: nil)
        setting.tabBarItem = UITabBarItem(title: "Setting", image: #imageLiteral(resourceName: "Path 4"), selectedImage: nil)
        favourite.tabBarItem = UITabBarItem(title: "Favourite", image: #imageLiteral(resourceName: "Path 37"), selectedImage: nil)
        self.viewControllers = [favourite,home, setting]
        self.selectedIndex = 1
        tabBar.items?[1].image = nil
    }
}


extension MainLayoutTapsViewController: UITabBarControllerDelegate  {
   
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch tabBar.selectedItem?.image {
        case #imageLiteral(resourceName: "Path 2"):
            handleClickOnHomeIcon()
        case #imageLiteral(resourceName: "Path 4"):
            handleClickOnSettingIcon()
        case #imageLiteral(resourceName: "Path 37"):
            handleClickOnFavouriteIcon()
        default:
            break
        }
    }
    
    private func handleClickOnHomeIcon(){
        customizedTabBar.selectedIndex = 2
        draw(selectedIndex: 2)
        selectHomeItem()
    }
    
    private func handleClickOnSettingIcon(){
        
        customizedTabBar.selectedIndex = 3
        draw(selectedIndex: 3)
        selectSettingItem()
    }
    
    private func handleClickOnFavouriteIcon(){
        customizedTabBar.selectedIndex = 1
        draw(selectedIndex: 1)
        selectFavouriteItem()
    }
    
    private func closeQuizFromClassroom(vc:UINavigationController){
        let viewControllers: [UIViewController] = vc.viewControllers as [UIViewController]
        vc.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
    
    private func closeQuizFromHome(vc:UINavigationController){
        let viewControllers: [UIViewController] = vc.viewControllers as [UIViewController]
        vc.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    private func draw(selectedIndex: Int) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut) { [unowned self] in
            let width = (self.customizedTabBar.frame.width / 3)
            let centerWidth:CGFloat = ( width * CGFloat(selectedIndex)) - ( width / 2)
            self.roundCircleview.frame = CGRect(x: centerWidth - 35, y: roundCircleview.frame.origin.y , width: 70, height: 70)
            self.customizedTabBar.centerWidth = self.roundCircleview.center.x
            customizedTabBar.draw(CGRect(x: 0, y: 0, width: 0, height: 0))
        }
    }
    
    private func selectHomeItem(){
        roundCircleview.imageView.image =  #imageLiteral(resourceName: "Path 33")
        tabBar.selectedItem?.image = nil
        tabBar.items?[0].image = #imageLiteral(resourceName: "Path 37")
        tabBar.items?[2].image = #imageLiteral(resourceName: "Path 4")
        tabBar.items?[0].title = ""
        tabBar.items?[2].title = ""
        tabBar.selectedItem?.title = NSLocalizedString("Home", comment: "")
    }
    
    private func selectSettingItem(){
        
        roundCircleview.imageView.image = #imageLiteral(resourceName: "Path 5")
        tabBar.selectedItem?.image = nil
        tabBar.items?[0].image = #imageLiteral(resourceName: "Path 37")
        tabBar.items?[1].image = #imageLiteral(resourceName: "Path 2")
        tabBar.items?[0].title = ""
        tabBar.items?[1].title = ""
        tabBar.selectedItem?.title = NSLocalizedString("Settings", comment: "")
    }
    
    private func selectFavouriteItem(){
        roundCircleview.imageView.image = #imageLiteral(resourceName: "Path 3")
        tabBar.selectedItem?.image = nil
        tabBar.items?[1].image = #imageLiteral(resourceName: "Path 2")
        tabBar.items?[2].image = #imageLiteral(resourceName: "Path 4")
        tabBar.items?[1].title = ""
        tabBar.items?[2].title = ""
        tabBar.selectedItem?.title = NSLocalizedString("Favourite", comment: "")
    }
}

