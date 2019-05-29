//
//  FormListView.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit
import Toast_Swift

class FormListView: UIViewController {

    var presenter: FormListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    var formlList: [FormInput]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FormList"
        // Do any additional setup after loading the view.
        self.tableView.estimatedRowHeight = 1000.0
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        self.tableView.tableFooterView = UIView()
        
        self.presenter?.retrieveFormList()
    }
    
}
extension FormListView: FormListViewProtocol{
    func showData(formInputList: [FormInput]) {
        self.formlList = formInputList
    }
    
    func showError() {
      self.view?.makeToast(ErrorMssage.responseError)
    }
}
extension FormListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
extension FormListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.formlList?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
            let formListCell = tableView.dequeueReusableCell(withIdentifier: "FormListCell", for: indexPath) as? FormListCell
        formListCell?.updateData(formObject: (formlList?[indexPath.row])!)
            cell = formListCell
        
        return cell!
    }
    
}
extension FormListView: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
}
