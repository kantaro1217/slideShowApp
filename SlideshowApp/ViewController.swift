//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宮崎　幹太郎 on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {
    
    let imageList = ["img1","img2","img3","img4"]
    var listSize: Int = 0
    var currentPos: Int = 0
    var timer: Timer!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let bigImageViewController: BigImageViewController = segue.destination as! BigImageViewController
        bigImageViewController.currentPos = self.currentPos
        if timer != nil{
            self.timer.invalidate()
            self.timer = nil
            proceedButton.isEnabled = true
            backButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }else{}
    }
    
    @IBAction func proceed(_ sender: Any) {
        if timer == nil {
            if self.currentPos+1 < self.listSize {
                self.currentPos += 1
                image.image = UIImage(named: imageList[currentPos])
            }
            else{
                self.currentPos = 0
                image.image = UIImage(named: imageList[currentPos])
            }
        }else{}
    }
    @IBAction func back(_ sender: Any) {
        if timer == nil {
            if self.currentPos > 0 {
                self.currentPos -= 1
                image.image = UIImage(named: imageList[currentPos])
            }else{
                self.currentPos = self.listSize - 1
                image.image = UIImage(named: imageList[currentPos])
            }
        }else{}
    }
    @IBAction func start(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(updateImg(_:)),userInfo: nil, repeats: true)
            proceedButton.isEnabled = false
            backButton.isEnabled = false
            startButton.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()
            self.timer = nil
            proceedButton.isEnabled = true
            backButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func updateImg(_ timer: Timer){
        if self.currentPos+1 < self.listSize {
            self.currentPos += 1
            image.image = UIImage(named: imageList[currentPos])
        }
        else{
            self.currentPos = 0
            image.image = UIImage(named: imageList[currentPos])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listSize = imageList.count
        currentPos = 0
        
        //set image
        image.image = UIImage(named: imageList[currentPos])
        
        
    }


}

