//
//  MainViewController.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/14.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import UIKit

/**
 *  tabbar背景色
 */
private let ColorTabBar = UIColor.white
/**
 *  title默认颜色
 */
private let ColorTitle = UIColor.gray
/**
 *  title选中颜色
 */
private let ColorTitleSel = ColorRGB(42,g: 194,b: 67)
/**
 *  title字体大小
 */
private let titleFontSize : CGFloat = 12.0

/**
 *  数字角标直径
 */
private let numMarkD:CGFloat = 20.0

/**
 *  小红点直径
 */
private let pointMarkD:CGFloat = 12.0

/**
 *  button 图片与文字上下占比
 */
private let scale:CGFloat = 0.55

extension MainViewController {
    /**
     *  切换显示控制器
     *
     *  - param: index 位置
     */
    public func showControllerIndex(_ index: Int){
        guard index < (tabbarData?.count)! else {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        self.seleBtn!.isSelected = false
        let button = (cusTabbar.viewWithTag(1000+index) as? UIButton)!
        button.isSelected = true
        self.seleBtn = button
        self.selectedIndex = index
    }
    /**
     *  设置数字角标
     *
     *  - param: num  所要显示数字
     *  - param: inde 位置
     */
    public func showBadgeMark(_ badge: Int, index: Int){
        guard index < (tabbarData?.count)! else {
            print("error: Index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var nFrame = numLabel.frame
        if badge <= 0 {
            // 隐藏角标
            self.hideMarkIndex(index)
        }else{
            if badge > 0 && badge <= 9 {
                nFrame.size.width = numMarkD
            } else if badge > 9 && badge <= 19 {
                nFrame.size.width = numMarkD+5
            } else {
                nFrame.size.width = numMarkD + 10
            }
            nFrame.size.height = numMarkD
            numLabel.frame = nFrame
            numLabel.layer.cornerRadius = numMarkD/2.0
            numLabel.text = "\(badge)"
            if badge > 99 {
                numLabel.text = "99+"
            }
        }
    }
    /**
     *  设置小红点
     *
     *  - param: index 位置
     */
    public func showPointMarkIndex(_ index: Int) {
        guard index < (tabbarData?.count)! else {
            print("error: index="+"\(index)"+"超出范围")
            return
        }
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var nFrame = numLabel.frame
        nFrame.size.height = pointMarkD
        nFrame.size.width = pointMarkD
        numLabel.frame = nFrame
        numLabel.layer.cornerRadius = pointMarkD/2.0
        numLabel.text = ""
    }
    
    /**
     *  隐藏指定位置角标
     *  - param: index 位置
     */
    public func hideMarkIndex(_ index: Int){
        guard index < (tabbarData?.count)! else {
            print("error:Index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (cusTabbar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = true
    }
    
}
// MARK: -TabBarButton
class ELTabBarButton:UIButton {
    override var isHighlighted: Bool{
        didSet{
            super.isHighlighted = false
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0.0
        let newY: CGFloat = 5.0
        let newWidth:CGFloat = CGFloat(contentRect.size.width)
        let newHeight:CGFloat = CGFloat(contentRect.size.height)*scale-newY
        return CGRect(x:newX, y:newY, width:newWidth, height:newHeight)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*scale
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*scale
        return CGRect(x:newX,y:newY,width:newWidth,height:newHeight)
    }
}

class MainViewController: UITabBarController {
    var seleBtn: UIButton?
    var tabbarData:NSMutableArray?
    var tabBarHeight:CGFloat = 49.0
    
    public init(controllerheight:CGFloat?){
        if let tempHeight = controllerheight{
            tabBarHeight = tempHeight
        }
        if tabBarHeight < 49.0 {
            tabBarHeight = 49
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        self.tabBar.addSubview(cusTabbar)
        addController()
        addTabBarButton()
        // Do any additional setup after loading the view.
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.removeTabBarButton()
    }
    
    required public init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    func initData(){
        tabbarData = NSMutableArray()
        var mainTabData:NSDictionary = NSDictionary()
        let filePath = Bundle.main.path(forResource: "MainTabbar.plist", ofType: nil)
        mainTabData = NSDictionary(contentsOfFile: filePath!)!
        let dataArr:NSArray = mainTabData["ItemArr"] as! NSArray
        
        for dics in dataArr {
            let model = TabbarData()
            model.title = (dics as! NSDictionary).object(forKey: "title") as? String
            model.controllStr = (dics as! NSDictionary).object(forKey: "contollerName") as? String
            model.tabbarImage = (dics as! NSDictionary).object(forKey: "backImage") as? String
            model.tabbarSelectImage = (dics as! NSDictionary).object(forKey: "selectedBackImage") as? String
            tabbarData?.add(model)
        }
    }
    
    fileprivate func addController(){
        guard (tabbarData?.count)! > 0 else {
            print("error:控制器数组为nil")
            return
        }
        var navArr = [UIViewController]()
        // 获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        for model in tabbarData! {
            let cls: AnyClass? = NSClassFromString(ns + "." + (model as! TabbarData).controllStr!)
            
            guard let vcCls = cls as? UIViewController.Type else {
                print("error: cls不能当做UIViewController")
                return
            }
            let vc = vcCls.init()
            vc.title = (model as! TabbarData).title
            let nav = UINavigationController(rootViewController: vc)
            navArr.append(nav)
        }
        viewControllers = navArr
    }
    /**
     *  移除系统创建的UITabBarButton
     */
    fileprivate func removeTabBarButton(){
        for view in tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!){
                view.removeFromSuperview()
            }
        }
    }
    fileprivate func addTabBarButton() {
        let num = tabbarData?.count
        for i in 0 ..< (tabbarData?.count)! {
            let x = CGFloat(ScreenWidth/CGFloat(num!)*CGFloat(i))
            let y:CGFloat = 0.0
            let w = ScreenWidth/CGFloat(num!)
            let h = tabBarHeight
            let button = ELTabBarButton(frame:CGRect(x:x,y:y,width:w,height:h))
            let model = tabbarData?.object(at: i) as! TabbarData
            button.tag = 1000+i
            button.setTitleColor(ColorTitle, for: UIControlState())
            button.setTitleColor(ColorTitleSel, for: UIControlState.selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize:titleFontSize)
            button.setImage(UIImage.init(named: model.tabbarImage!), for: UIControlState())
            button.setImage(UIImage.init(named: model.tabbarSelectImage!), for: UIControlState.selected)
            button.setTitle(model.title, for: UIControlState())
            button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchDown)
            cusTabbar.addSubview(button)
            
            // 默认选中
            if i == 0 {
                button.isSelected = true
                self.seleBtn = button
            }
            // 角标
            let numLabel = UILabel(frame: CGRect(x:button.frame.size.width/2.0+6,y:3,width:numMarkD,height:numMarkD))
            numLabel.layer.masksToBounds = true
            numLabel.layer.cornerRadius = 10
            numLabel.backgroundColor = UIColor.red
            numLabel.textColor = UIColor.white
            numLabel.textAlignment = NSTextAlignment.center
            numLabel.font = UIFont.systemFont(ofSize: 13)
            numLabel.tag = 1020+i
            numLabel.isHidden = true
            button.addSubview(numLabel)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     *  处理高度>49 tabbar顶部线
     */
    fileprivate func setupTabbarLine(){
        guard tabBarHeight > 49 else {
            return;
        }
        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.backgroundImage = UIImage.init()
        let line = UILabel(frame:CGRect(x:0,y:0,width:ScreenWidth,height:0.5))
        cusTabbar.addSubview(line)
    }
    
    // MARK: -Action
    @objc fileprivate func buttonAction(_ button:UIButton) {
        let index: Int = button.tag - 1000
        self.showControllerIndex(index)
    }
    
    // MARK: -  懒加载
    fileprivate lazy var cusTabbar: UIView = {
        let x = CGFloat(0)
        let y = 49.0 - self.tabBarHeight
        let width = ScreenWidth
        let height = self.tabBarHeight
        let view = UIView(frame:CGRect(x:x, y:y, width:width,height:height))
        view.backgroundColor = ColorTabBar
        return view
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
