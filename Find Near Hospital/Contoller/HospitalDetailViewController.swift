//
//  HospitalDetailViewController.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 15/07/21.
//

import UIKit

class HospitalDetailViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var callButton: UIButton!
    var favoriteButton : UIBarButtonItem?
    var unfavoriteButton : UIBarButtonItem?
    var hospital : Hospital?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(favoriteTapped))
        
        unfavoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(unfavoriteTapped))
        
        bindToView()
    }
    @IBAction func btnCallTapped(_ sender: Any) {
        
        callNumber(phoneNumber:hospital?.phone ?? "")
    }
    
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func bindToView() {
        if let hospitalData = hospital {
            img.image = UIImage(named: hospitalData.image)
            name.text = hospitalData.name
            address.text = "\(hospitalData.address) \(hospitalData.region)"
            phone.text = hospitalData.phone
        }
        
        if checkIsFavorite() {
            navigationItem.setRightBarButton( unfavoriteButton, animated: true)
        }else {
            navigationItem.setRightBarButton( favoriteButton, animated: true)
        }
        navigationController?.navigationBar.tintColor = UIColor(named: "Primary Color")
        
        callButton.makeRoundCorners(byRadius: 18)
    }
    
    func checkIsFavorite() -> Bool {
        let isFavorite = HospitalRepository.favoriteHospitals.contains{element in
            if element == hospital{
                return true
            }
            return false
        }
        return isFavorite
    }
    
    @objc func favoriteTapped(){
        HospitalRepository.favoriteHospitals.append(hospital!)
        navigationItem.setRightBarButton( unfavoriteButton, animated: true)
    }
    
    @objc func unfavoriteTapped(){
        if let index = HospitalRepository.favoriteHospitals.firstIndex(of: hospital!) {
            HospitalRepository.favoriteHospitals.remove(at: index)
        }
        navigationItem.setRightBarButton( favoriteButton, animated: true)
    }
    
}
