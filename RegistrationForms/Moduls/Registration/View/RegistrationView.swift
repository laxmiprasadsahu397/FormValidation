//
//  RegistrationView.swift
///  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit
import Toast_Swift

class RegistrationView: UIViewController {

    var presenter: RegistrationPresenterProtocol?
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_Dob: UITextField!
    @IBOutlet weak var txt_nationality: UITextField!
    @IBOutlet weak var txt_occupotion: UITextField!
    @IBOutlet weak var txt_zipCode: UITextField!
    @IBOutlet weak var txt_age: UITextField!
    @IBOutlet weak var txt_height: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var switchValue: UISwitch!
    @IBOutlet weak var slider: UISlider!
    var customAlart: CustomAlartView = CustomAlartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Form"
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show", style: .plain, target: self, action: #selector(self.showButton(sender:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButton(sender:)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func showButton(sender: Any) {
        self.view.endEditing(true)
        let formlistview = FormListWireFrame.createFormListModule() as? FormListView
        self.navigationController?.pushViewController(formlistview!, animated: true)
    }
    
    @objc func saveButton(sender: Any) {
        self.view.endEditing(true)
        let formInputModel = FormInputModel()
        
        guard self.txt_Name.text != "" || self.txt_Name.text?.count ?? 0 >= 3 else {
            self.view?.makeToast(FormValidate.kNameErr)
            return
        }
        guard self.txt_nationality.text != "" else {
            self.view?.makeToast(FormValidate.knationalityErr)
            return
        }
        guard self.txt_occupotion.text != "" else {
            self.view?.makeToast(FormValidate.kOccupationErr)
            return
        }
        guard self.txt_age.text != "" else {
            self.view?.makeToast(FormValidate.kageErr)
            return
        }
        guard self.txt_height.text != "" else {
            self.view?.makeToast(FormValidate.kheightErr)
            return
        }
        
        formInputModel.name = self.txt_Name.text
        formInputModel.age = Int(self.txt_age.text ?? "0")
        formInputModel.birthDate = self.txt_Dob.text
        formInputModel.occupation = self.txt_occupotion.text
        formInputModel.nationality = self.txt_nationality.text
        formInputModel.height = Int(self.txt_height.text ?? "0")
        formInputModel.vegetarian = self.switchValue.isOn
        formInputModel.drivingSkill = Int(self.slider.value)
        self.presenter?.saveFormDetails(formInputModel: formInputModel)
    }
        
    @IBAction func usertappedDropDown(_ sender: UIButton) {
        customAlart.delegate = self
        customAlart.createCustomAlartView(controller: self)
    }
    
    
}
extension RegistrationView: RegistrationViewProtocol{
    
//    func showData(_ formResponseModel: FormResponseModel) {
//
//    }
    
    func showError() {
      self.view?.makeToast(ErrorMssage.responseError)
    }
}
extension RegistrationView: CustomAlartViewDelegate {
    func selectedVanueForRegister(selectedIndex: String) {
        self.txt_nationality.text = selectedIndex
    }

}
extension RegistrationView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField != self.txt_zipCode else {
        let maxLength = 5
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        }
        return true
    }
}
extension RegistrationView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
