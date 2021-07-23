//
//  ProfileViewController.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 17/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtShortBiography: UILabel!
    @IBOutlet weak var txtHobby: UILabel!
    var closeButton : UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgProfile.image = UIImage(named: "GalangAji")
        imgProfile.makeRoundCorners(byRadius: imgProfile.frame.height/2)
        txtName.text = "Galang Aji Susanto"
        txtShortBiography.text = "I'm a software engineer pasionate on design and building a mobile app. Lets make dream come true!"
        txtHobby.text = "Hobby: Playing Game, Sport and Sleeping"
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true,completion: nil)
        
    }
}
