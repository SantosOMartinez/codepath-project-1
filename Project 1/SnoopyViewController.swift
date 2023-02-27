//
//  SnoopyViewController.swift
//  Project 1
//
//  Created by Santos O. Martínez Braña on 2/26/23.
//

import UIKit

class SnoopyViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapButton(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else {
            return
        }

        typealias DetailView = DetailViewController

        guard let tappedView = sender as? UIButton,
              let detailView = segue.destination as? DetailView else {
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
