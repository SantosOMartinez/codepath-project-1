//
//  DetailViewController.swift
//  Project 1
//
//  Created by Santos O. Martínez Braña on 2/26/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailInfo: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var imageContainer: UIView!

    var info: Info?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let info = info else {
            return
        }

        styleImage()

        detailImage.image = info.image
        detailInfo.text = info.text
    }


    func styleImage() {
        detailImage.clipsToBounds = true
        detailImage.layer.cornerRadius = 16
    }
}
