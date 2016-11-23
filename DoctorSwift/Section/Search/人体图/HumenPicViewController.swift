//
//  HumenPicViewController.swift
//  DoctorSwift
//
//  Created by Eleven on 16/11/23.
//  Copyright © 2016年 Eleven. All rights reserved.
//

import UIKit

class HumenPicViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton(image: UIImage.init(named: "barItemBackBlack")!, title: " 返回", titleColor: UIColor.gray, target: self, action: #selector(leftItemClick))
        // Do any additional setup after loading the view.
    }

    func leftItemClick() {
        self.navigationController?.popViewController(animated: false)
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
