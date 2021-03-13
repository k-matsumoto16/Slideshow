//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by 松本光輝 on 2021/03/11.
//

import UIKit

class SlideViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    

}
