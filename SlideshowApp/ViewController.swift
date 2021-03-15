//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松本光輝 on 2021/03/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var nextSlideButton: UIButton!
    @IBOutlet weak var backSlideButton: UIButton!
    
    //タイマー
    var timer: Timer!
    
    //配列指定
    var nowIndex: Int = 0
    
    //スライドさせる画像を配置
    var imageArrey: [UIImage] = [
        UIImage(named: "slideimage_01")!,
        UIImage(named: "slideimage_03")!,
        UIImage(named: "slideimage_02")!
    ]
    
    //次へボタン押下時の処理
    @IBAction func nextButton(_ sender: Any) {
        changeImage()
    }
    //戻る押下時の処理
    @IBAction func backButton(_ sender: Any) {
        nowIndex -= 1
        if (nowIndex < 0){
            nowIndex = imageArrey.count - 1
        }
        imageView.image = imageArrey[nowIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArrey[nowIndex]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:SlideViewController = segue.destination as! SlideViewController
        resultViewController.image = imageArrey[nowIndex]
        
        if self.timer == nil {
            imageView.image = imageArrey[nowIndex]
            
        }else{
            //タイマーを停止
            self.timer.invalidate()
            
            //タイマーを削除
            self.timer = nil
            
            // ボタンの名前を再生に変える
            slideButton.setTitle("再生", for: .normal)
            
            //次へ・戻るボタンを有効化
            nextSlideButton.isEnabled = true
            backSlideButton.isEnabled = true
            
        }
    }
    
    //再生ボタン押下時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        //再生・停止を判定
        if self.timer == nil {
            //タイマーセット
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            slideButton.setTitle("停止", for: .normal)
            //次へ・戻るボタンを無効化
            nextSlideButton.isEnabled = false
            backSlideButton.isEnabled = false
            
        }else{
            //タイマーを停止
            self.timer.invalidate()
            
            //タイマーを削除
            self.timer = nil
            
            // ボタンの名前を再生に変える
            slideButton.setTitle("再生", for: .normal)
            //次へ・戻るボタンを有効化
            nextSlideButton.isEnabled = true
            backSlideButton.isEnabled = true
            
        }
    }
    @objc func changeImage(){
        // indexを増やして表示画像を追加
        nowIndex += 1
        if (nowIndex == imageArrey.count){
            //indexを最初に戻す
            nowIndex = 0
        }
        imageView.image = imageArrey[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
}

