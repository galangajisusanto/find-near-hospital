//
//  HospitalTableViewController.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 12/07/21.
//

import UIKit

class HospitalTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var hospitals: [Hospital] = []
    var hospitalDatas: [Hospital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatas()
        bindToView()
    }
    
    
    func bindToView() {
        self.navigationItem.searchController = searchController
        self.searchController.searchResultsUpdater = self
        
        tableView.register(UINib(nibName: Constant.hospitalTableViewCell, bundle: nil), forCellReuseIdentifier:Constant.hospitalReuseIdentifierCell )
    }
    
    func getDatas() {
        for hospital in HospitalRepository().getHospitals() {
            hospitals.append(hospital)
            hospitalDatas.append(hospital)
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.hospitalReuseIdentifierCell, for: indexPath) as! HospitalTableViewCell
        
        let hospital = hospitals[indexPath.row]
        cell.name.text = hospital.name
        cell.adress.text = hospital.address
        cell.img.image=UIImage(named: hospital.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HospitalDetailViewController(nibName: Constant.hospitalDetailViewController, bundle: nil)
        vc.hospital = hospitals[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HospitalTableViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else {
            return
        }
        
        if text.isEmpty{
            hospitals = hospitalDatas
        }else {
            let hospitalsByName = hospitalDatas.filter{
                $0.name.lowercased().contains(text.lowercased())
            }
            hospitals = hospitalsByName
        }
        tableView.reloadData()
    }
    
}
