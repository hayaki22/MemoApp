//
//  MemoViewController.swift
//  MemoApp
//
//  Created by Hayaki Maruta on 2021/07/28.
//

import UIKit

class MemoViewController: UIViewController {
    var memo: String?
    @IBOutlet var memoTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = false
        
        if let memo = self.memo{
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
      
    }
    
    @IBAction func memoTextFieldChanged(_ sender: Any) {
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController {
        self.dismiss(animated: true, completion: nil)
        }else{self.navigationController?.popViewController(animated: true)
            
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.memo = self.memoTextField.text ?? ""
    }
    

}

