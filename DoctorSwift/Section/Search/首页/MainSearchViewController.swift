//
//  MainSearchViewController.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import UIKit

class MainSearchViewController: UIViewController {
    
    var collectionView:UICollectionView!
    var hotSearchArr = NSMutableArray()
    let weathImg = UIImageView()

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        layoutSubviews()
        // Do any additional setup after loading the view.
    }
    func initData(){
        let hotImage = "image", nameTitle = "title"
        hotSearchArr.add([hotImage:"hotSearchType2",nameTitle:"男性"])
        hotSearchArr.add([hotImage:"hotSearchType3",nameTitle:"女性"])
        hotSearchArr.add([hotImage:"hotSearchType1",nameTitle:"当季"])
        hotSearchArr.add([hotImage:"hotSearchType4",nameTitle:"老人"])
        hotSearchArr.add([hotImage:"hotSearchType5",nameTitle:"儿童"])
        hotSearchArr.add([hotImage:"hotSearchType2",nameTitle:"男性"])
        hotSearchArr.insert([hotImage:"hotSearchType5",nameTitle:"儿童"], at: 0)
    }

    func layoutSubviews(){
        
        let weatherBtn = UIButton()
        weatherBtn .setImage(UIImage.init(named: "WeatherBtn"), for: .normal)
        self.view.addSubview(weatherBtn)
        weatherBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(25)
            make.left.equalTo(self.view).offset(5)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 17)
        lable.textColor = subjectColor
        lable.textAlignment = .center
        lable.text = "半 个 医 生"
        self.view.addSubview(lable)
        lable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(30)
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(20)
        }
        
        let logoImage = UIImage.init(named: "HomePageBackground")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 30, 0, 30), resizingMode: UIImageResizingMode.stretch)
        let backImageView = UIImageView()
        backImageView.image = logoImage
        self.view.addSubview(backImageView)
        backImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(80)
            make.centerX.equalTo(self.view)
            make.width.equalTo((logoImage?.size.width)!)
            make.height.equalTo((logoImage?.size.height)!)
        }
        let searchBtn = UIButton()
        searchBtn.setTitle("输入症状/疾病, 如: 发热", for: .normal)
        searchBtn.setTitleColor(mainColor, for: .normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        searchBtn.titleEdgeInsets = UIEdgeInsetsMake(32, 22, 32, 0)
        searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        searchBtn.setBackgroundImage(UIImage.init(named: "SearchSquare"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchDiease(_:)), for: .touchUpInside)
        self.view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(118)
            make.left.equalTo(self.view).offset(12)
            make.width.equalTo(ScreenWidth - 24)
            make.height.equalTo(44)
        }
        
        let searchImageView = UIImageView()
        searchImageView.image = UIImage.init(named: "SeachIcons")
        searchBtn.addSubview(searchImageView)
        searchImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(searchBtn).offset(12)
            make.right.equalTo(searchBtn).offset(-22)
            make.width.height.equalTo(20)
        }
        
        let btnImage = "image", btnTitle = "title", btnBgColor = "bgColor", btnSelector = "selector"
        let btnInfoArr = NSMutableArray()
        btnInfoArr.add([btnImage:"whiteBodyIcon",btnTitle:"人体图",btnBgColor:ColorRGB(119,g: 217,b: 83),btnSelector:"showHumanBodyPressed:"])
        btnInfoArr.add([btnImage:"whiteMedicinalIcon",btnTitle:" 购 药", btnBgColor:mainColor, btnSelector:"showMedicinalSearchPressed:"])
        btnInfoArr.add([btnImage:"whiteIndicatorIcon",btnTitle:" 指 标",btnBgColor:ColorRGB(119,g: 217,b: 83),btnSelector:"showIndicatorBtnPressed:"])
        for i in 0..<(btnInfoArr.count) {
            let dic = btnInfoArr.object(at: i) as! NSDictionary
            let btn = UIButton()
            btn.backgroundColor = dic.object(forKey: btnBgColor) as! UIColor?
            btn.layer.cornerRadius = 14
            btn.layer.masksToBounds = true
            btn.titleLabel?.textColor = UIColor.white
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            let imageStr = dic.object(forKey: btnImage)
            btn.setImage(UIImage.init(named: imageStr as! String), for: .normal)
            btn.setTitle(dic.object(forKey: btnTitle) as! String?, for: .normal)
            btn.addTarget(self, action: NSSelectorFromString(dic.object(forKey: btnSelector) as! String), for: .touchUpInside)
            self.view.addSubview(btn)
            let distance = Int(ScreenWidth - 240) / 4 + 120 * i
            btn.snp.makeConstraints({ (make) -> Void in
                make.left.equalTo(self.view).offset(distance)
                make.top.equalTo(self.view).offset((logoImage?.size.height)! + 81)
                make.width.equalTo(80)
                make.height.equalTo(28)
            })
        }
        
        let leftLine = UIImageView()
        leftLine.image = UIImage.init(named: "segLine")
        self.view.addSubview(leftLine)
        leftLine.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(5)
            make.top.equalTo(self.view).offset((logoImage?.size.height)! + 140)
            make.width.equalTo(ScreenWidth/2 - 55)
            make.height.equalTo(1)
        }
        
        let hotImageView = UIImageView()
        let hotImage = UIImage.init(named: "Hotseek")
        hotImageView.image = hotImage
        self.view.addSubview(hotImageView)
        hotImageView.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(leftLine).offset(26)
            make.top.equalTo(leftLine).offset(-(hotImage?.size.height)!/2)
            make.width.equalTo((hotImage?.size.width)!)
            make.height.equalTo((hotImage?.size.height)!)
        }
        
        let hotLabel = UILabel()
        hotLabel.text = "热查症状"
        hotLabel.textColor = subjectColor
        hotLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.view.addSubview(hotLabel)
        hotLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(hotImageView).offset(8+(hotImage?.size.width)!)
            make.top.equalTo(hotImageView)
            make.width.equalTo(100)
            make.height.equalTo((hotImage?.size.height)!)
        }
        
        let rightLine = UIImageView()
        rightLine.image = UIImage.init(named: "segLine")
        self.view.addSubview(rightLine)
        rightLine.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(leftLine).offset(ScreenWidth/2+45)
            make.top.equalTo(leftLine)
            make.width.equalTo(ScreenWidth/2-55)
            make.height.equalTo(1)
        }
        
        let layout = LineLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 3.0
        let width = (ScreenWidth - 12.0) / 5
        layout.itemSize = CGSize(width:width, height:100)
        collectionView = UICollectionView(frame:CGRect(x:0,y:250,width:ScreenWidth,height:130), collectionViewLayout:layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.register(HotSearchCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HotSearchCollectionViewCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setContentOffset(CGPoint(x:(width), y:0), animated: true)
        self.view.addSubview(self.collectionView)
        
        let downArrowImg = UIImageView()
        downArrowImg.image = UIImage.init(named: "hotSearchIndicator")
        self.view.addSubview(downArrowImg)
        downArrowImg.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(ScreenWidth/2-53)
            make.top.equalTo(self.view).offset(360)
            make.width.equalTo(106)
            make.height.equalTo(9)
        }

    }
    
    @objc fileprivate func searchDiease(_ button:UIButton) {
        
    }
    
    @objc fileprivate func showHumanBodyPressed(_ button:UIButton) {
        let humanBodyVC = HumenPicViewController()
        humanBodyVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(humanBodyVC, animated: true)
    }
    
    @objc fileprivate func showMedicinalSearchPressed(_ button:UIButton) {
        let drugBuyVC = DrugBuyViewController()
        drugBuyVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(drugBuyVC, animated: true)
    }
    
    @objc fileprivate func showIndicatorBtnPressed(_ button:UIButton) {
        let indicatorVC = IndicatorViewController()
        indicatorVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(indicatorVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    // UICollectionView代理方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotSearchArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HotSearchCollectionViewCell.self), for: indexPath) as! HotSearchCollectionViewCell
        let row = indexPath.row
        let humanImgDic = hotSearchArr.object(at: row) as! NSDictionary
        cell.humanImg.image = UIImage.init(named: humanImgDic.object(forKey: "image") as! String)
        cell.nameLabel.text = humanImgDic.object(forKey: "title") as! String?
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let lastItemOffsetX = collectionView.contentSize.width - collectionView.frame.width
        let firstItemOffsetX = collectionView.frame.width
        
        if scrollView.contentOffset.x >= lastItemOffsetX {
            
        }else if scrollView.contentOffset.x < firstItemOffsetX {
            
        } else{
            
        }
        
    }
    
}





























