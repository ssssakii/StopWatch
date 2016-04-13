//
//  ViewController.swift
//  StopWatch
//
//  Created by 高田早記 on 2016/04/13.
//  Copyright © 2016年 高田早記. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var StartButton: UIButton!
    var StopButton: UIButton!
    
    var label: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ボタンの生成
        StartButton = UIButton()
        StopButton = UIButton()
        
        //サイズを設定する
        StartButton.frame = CGRectMake(0, 0, 200, 40)
        StopButton.frame = CGRectMake(0, 0, 200, 40)
        
        //背景色を設定する
        StartButton.backgroundColor = UIColor.redColor()
        StopButton.backgroundColor = UIColor.redColor()
        
        //枠を丸くする
        StartButton.layer.masksToBounds = true
        StopButton.layer.masksToBounds = true
        
        //タイトルを設定する
        StartButton.setTitle("START", forState: UIControlState.Normal)
        StopButton.setTitle("STOP", forState: UIControlState.Normal)
        
        //ボタンの位置を設定
        StartButton.layer.position = CGPoint(x: self.view.frame.width/2, y: 300)
        StopButton.layer.position = CGPoint(x: self.view.frame.width/2, y: 400)
        
        //イベントを追加する
        StartButton.addTarget(self, action: "start:", forControlEvents: .TouchUpInside)
        StopButton.addTarget(self, action: "stop:", forControlEvents: .TouchUpInside)
        
        //ボタンをViewに追加
        self.view.addSubview(StartButton)
        self.view.addSubview(StopButton)
        
        
        //labelの生成
        label = UILabel(frame: CGRectMake(0, 0, 100, 20))
        label.text = "0.00"
        label.backgroundColor = UIColor.yellowColor();////背景色
        label.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        self.view.addSubview(label)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(sender: UIButton){
        if !timer.valid {
            //もしタイマーが動いてなかったら、動かす
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("up"), userInfo: nil, repeats: true)
        }
    }
    
    func stop(sender: UIButton){
        if timer.valid {
            //もしタイマーが作動していたら止める
            timer.invalidate()
        }
    }
    
    func up() {
        //countを0.01(時間経過分たす)
        count += 0.01
        //labelに小数第2桁まで表示
        label.text = String(format: "%.2f", count)
    }


}

