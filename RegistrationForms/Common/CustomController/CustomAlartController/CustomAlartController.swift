//
//  CustomAlartController.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

protocol CustomAlartViewDelegate {
    func selectedVanueForRegister(selectedIndex: String)
}

class CustomAlartView: NSObject {
    
    private var controller: UIViewController?
    private var nationalityList: [Nationality]?
    var delegate: CustomAlartViewDelegate?
    
    func createCustomAlartView(controller: UIViewController) {
        self.controller = controller
    
        let alrController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        nationalityList = [Nationality.de, Nationality.it, Nationality.jp, Nationality.ru, Nationality.us, Nationality.other]
        
        let margin:CGFloat = 8.0
        let rect = CGRect(x: margin, y:margin, width:alrController.view.bounds.size.width - margin * 4.0, height:controller.view.frame.height * 0.60)
        let tableView = UITableView(frame: rect)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.white
        alrController.view.addSubview(tableView)
        tableView.reloadData()
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alrController.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: controller.view.frame.height * 0.60)
        alrController.view.addConstraint(height)
        DispatchQueue.main.async {
            controller.present(alrController, animated: true, completion:{})
        }
    }
}
extension CustomAlartView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nationalityList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
//        customCell.delegate = self
        customCell.updateData(nationalityName: self.nationalityList?[indexPath.row].rawValue ?? "")
        
        return customCell
    }
    
    
}
extension CustomAlartView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let customView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as? CustomHeaderView else {
            return UIView()
        }
        customView.delegate = self
        return customView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.controller?.dismiss(animated: true, completion: {
                self.delegate?.selectedVanueForRegister(selectedIndex: self.nationalityList?[indexPath.row].rawValue ?? "")
            })
        }
    }
    
}

extension CustomAlartView: CustomHeaderViewDelegate {
    func btn_closeAction(_ sender: UIButton) {
        print("Close button tapped")
        DispatchQueue.main.async {
            self.controller?.dismiss(animated: true, completion: nil)
        }
    }
    
}
