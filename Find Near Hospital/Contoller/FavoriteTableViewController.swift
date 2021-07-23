//
//  FavoriteTableViewController.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 12/07/21.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var favoriteHospitals: [Hospital] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatas()
        bindToView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDatas()
        reloadData()
    }
    
    func getDatas() {
        favoriteHospitals.removeAll()
        for hospital in HospitalRepository.favoriteHospitals {
            favoriteHospitals.append(hospital)
        }
    }
    
    func bindToView()  {
        self.navigationItem.searchController = searchController
        self.searchController.searchResultsUpdater = self
        
        tableView.register(UINib(nibName: Constant.hospitalTableViewCell, bundle: nil), forCellReuseIdentifier:Constant.hospitalReuseIdentifierCell )
    }
    
    func reloadData()  {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteHospitals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.hospitalReuseIdentifierCell, for: indexPath) as! HospitalTableViewCell
        
        let hospital = favoriteHospitals[indexPath.row]
        cell.name.text = hospital.name
        cell.adress.text = hospital.address
        cell.img.image=UIImage(named: hospital.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HospitalDetailViewController(nibName: Constant.hospitalDetailViewController, bundle: nil)
        vc.hospital = favoriteHospitals[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension FavoriteTableViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else {
            return
        }
        
        if text.isEmpty{
            favoriteHospitals = HospitalRepository.favoriteHospitals
        }else {
            let hospitalsByName = HospitalRepository.favoriteHospitals.filter{
                $0.name.lowercased().contains(text.lowercased())
            }
            favoriteHospitals = hospitalsByName
        }
        tableView.reloadData()
    }
    
}
