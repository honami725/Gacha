//
//  ResultViewController.swift
//  Gacha
//
//  Created by Honami on 2016/02/10.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //背景
    @IBOutlet var haikeiImageView:UIImageView!
    
    //モンスター
    @IBOutlet var monsterImageView:UIImageView!
    
    //モンスター画像を保存
    var monsterArray:[UIImage]!
    var monsterName:[String] = ["ねこ","さかな","むかで", "だてんし", "ナイト", "どらごん", "まほうつかい","ゴルドラ", "魔導師","アテナ"]
    
    @IBOutlet var label:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //乱数
        let number = Int(arc4random() % 10)
        
        monsterArray = [UIImage(named: "monster001.png")!,
            UIImage(named: "monster002.png")!,
            UIImage(named: "monster003.png")!,
            UIImage(named: "monster004.png")!,
            UIImage(named: "monster005.png")!,
            UIImage(named: "monster006.png")!,
            UIImage(named: "monster007.png")!,
            UIImage(named: "monster008.png")!,
            UIImage(named: "monster009.png")!,
            UIImage(named: "monster010.png")!,
            
            
        ]
        
        //セット
        monsterImageView.image = monsterArray[number]
        
        //numberによって切り替え
        if number == 9{
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        }else if number > 6{
            haikeiImageView.image = UIImage(named: "bg_red.png")
        }else{
            haikeiImageView.image = UIImage(named: "bg_blu e.png")
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        //変形を指定
        let animation = CABasicAnimation(keyPath: "transform")
        let manimation = CABasicAnimation(keyPath: "transform")
        
        //開始時
        animation.fromValue = NSNumber(double: 0)
        manimation.fromValue = NSNumber(double: 0)
        
        //終了時
        animation.toValue = NSNumber(double: 2*M_PI)
        manimation.toValue = NSNumber(double: -2*M_PI)
        
        
        
        //z軸を中心とした回転
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        manimation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        //スピード
        animation.duration = 5
        manimation.duration = 1
        
        //無限に繰り返す
        animation.repeatCount = Float.infinity
        manimation.repeatCount = 2
        
        //背景をアニメーションさせる
        monsterImageView.layer.addAnimation(manimation, forKey: nil)
        haikeiImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    @IBAction func modoru(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
