//
//  SnoopyViewController.swift
//  Project 1
//
//  Created by Santos O. Martínez Braña on 2/26/23.
//

import UIKit

class SnoopyViewController: UIViewController {

    let DETAIL_SEGUE = "detailSegue"

    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Make the cover image a circle
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }

    @IBAction func didTapButton(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: DETAIL_SEGUE, sender: tappedView)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == DETAIL_SEGUE else {
            return
        }

        guard let tappedView = sender as? UIButton,
              let detailView = segue.destination as? DetailViewController else {
                  return
        }


        let tag = tappedView.tag
        guard tag >= 0 && tag < funFacts.count else {
            print("No information was tapped, please check your selection.")
            return
        }

        detailView.title = tappedView.titleLabel?.text
        detailView.info = funFacts[tag]
    }
}
