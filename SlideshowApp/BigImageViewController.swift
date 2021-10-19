//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by 宮崎　幹太郎 on 2021/10/19.
//

import UIKit

class BigImageViewController: UIViewController {
    
    let imageList = ["img1","img2","img3","img4"]
    var currentPos: Int = 0

    @IBOutlet weak var bigImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigImage.image = UIImage(named: imageList[currentPos])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
