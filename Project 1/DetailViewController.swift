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


    var info: Info?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let info = info else {
            return
        }

        customStyles(info)

        detailImage.image = info.image
        detailInfo.text = info.text
    }

    func customStyles(_ info: Info) {
        detailImage.clipsToBounds = true
        detailImage.layer.cornerRadius = 16
        detailInfo.textColor = info.color
        view.backgroundColor = info.bg

        navigationController?.navigationBar.prefersLargeTitles = true
        typealias Attributes = [NSAttributedString.Key : Any]

        let attributes: Attributes = [.foregroundColor: info.color]
        let appearance = UINavigationBarAppearance()

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = info.bg
        appearance.titleTextAttributes = attributes
        appearance.largeTitleTextAttributes = attributes
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance

    }
}
