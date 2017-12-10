//
//  SecondViewController.swift
//  To-Do-List-Work
//
//  Created by amadeus on 2017. 6. 8..
//  Copyright © 2017년 DIT Apps. All rights reserved.
//

import UIKit

class SecondViewController:  UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var btn_phone: UIButton!
    @IBOutlet weak var btn_cart: UIButton!
    @IBOutlet weak var btn_child: UIButton!
    @IBOutlet weak var contentView: UITextView!
    @IBOutlet weak var itemTextField: UITextField!
    var x=0;
    @IBOutlet weak var contentField: UITextField!
    var chk=0;
    
    let defaults = UserDefaults.standard
    var items = [dataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: UIButton) {
        
        let currentDate = Date()
        let format = DateFormatter()
        format.locale = NSLocale(localeIdentifier: "ko_kr") as Locale!
        format.dateFormat = "yyyy-MM-dd"
        
        if contentView.text != "" {
            
                        if let decoded = defaults.object(forKey: "items") as? NSData {
                            let itemObject = NSKeyedUnarchiver.unarchiveObject(with: decoded as Data) as! [dataModel]
                            items = itemObject
                            
                            let inputTitle = itemTextField.text
                            let inputcontent = contentView.text
                            let inputDate = format.string(from: currentDate)
                            var inputimage = ""
                            if x==1 {
                                inputimage = "child.png"
                            }else if x==2{
                                inputimage = "shopping-cart-selected.png"
                            }else{
                                inputimage = "phone-selected.png"
                            }
                            let newItem = dataModel(title: inputTitle!, date: inputDate, image:inputimage, content:inputcontent!)
                            
                            items.append(newItem)
                            print(items)
                            defaults.set(NSKeyedArchiver.archivedData(withRootObject: items), forKey: "items")
                            
                            // 다음 입력을 위해 텍스트필드 초기화
                            itemTextField.text = ""
                            contentView.text = ""
                            showAlert()
            
            }

            
            
        } else {
            let newItem = dataModel(title: itemTextField.text! , date: format.string(from: currentDate), image:"cart.png", content: contentView.text!)
            items = [newItem]
            print(items)
            let alertController = UIAlertController(title: "메모장", message: "메모를 작성해 주세요", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            


        }
        
        // key 값이 "items"로 items 배열을 저장소에 encode하여 저장함(다음에 불러 오기 위해)
      
    }
    
    // 바탕화면의 View를 누르면 키패드가 내려간다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // [Return] 키를 누르면 키패드가 내려간다.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func img1(_ sender: Any) {
        x=1;
        btn_child.setImage(#imageLiteral(resourceName: "child@"), for: .normal)
        btn_phone.setImage(#imageLiteral(resourceName: "phone-selected"), for: .normal)
        btn_cart.setImage(#imageLiteral(resourceName: "shopping-cart-selected"), for: .normal)
    }
    @IBAction func img2(_ sender: Any) {
        x=2;
        btn_cart.setImage(#imageLiteral(resourceName: "shopping-cart"), for: .normal)
        btn_phone.setImage(#imageLiteral(resourceName: "phone-selected"), for: .normal)
        btn_child.setImage(#imageLiteral(resourceName: "child"), for: .normal)
        
    }
    @IBAction func img3(_ sender: Any) {
        x=3;
        btn_phone.setImage(#imageLiteral(resourceName: "phone"), for: .normal)
        btn_cart.setImage(#imageLiteral(resourceName: "shopping-cart-selected"), for: .normal)
        btn_child.setImage(#imageLiteral(resourceName: "child"), for: .normal)
    }
    func showAlert() {
        let alertController = UIAlertController(title: "메모장", message: "메모작성이 완료되엇습니다!", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

