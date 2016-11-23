//
//  HotSearchCollectionViewCell.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/22.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import UIKit

class HotSearchCollectionViewCell: UICollectionViewCell {
    let humanImg = UIImageView()
    let nameLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        humanImg.layer.masksToBounds = true
        humanImg.layer.cornerRadius = 25
        self.addSubview(humanImg)
        let leftDis = ((ScreenWidth - 12) / 5 - 50)/2
        humanImg.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(leftDis)
            make.top.equalTo(self).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = subjectColor
        nameLabel.textAlignment = NSTextAlignment.center
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(70)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
