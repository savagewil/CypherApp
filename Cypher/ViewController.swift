//
//  ViewController.swift
//  Cypher
//
//  Created by William Savage on 6/18/19.
//  Copyright © 2019 William Savage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var InputText: UITextView!
    @IBOutlet weak var KeyText: UITextView!
    @IBOutlet weak var OutputText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        InputText.inputAccessoryView = toolbar
        KeyText.inputAccessoryView = toolbar
        OutputText.inputAccessoryView = toolbar
        //setting toolbar as inputAccessoryView
    }

    @IBAction func EncodeClicked(_ sender: Any) {
        OutputText.text = encode_savage(plainText: InputText.text, keyString: KeyText.text)
    }
    
    @IBAction func DecodeClicked(_ sender: Any) {
        OutputText.text = decode_savage(cypherText: InputText.text, keyString: KeyText.text)
    }
    @IBAction func CopyClicked(_ sender: Any) {
        UIPasteboard.general.string = OutputText.text
    }
    
    @objc func doneButtonAction(){
        self.view.endEditing(true)
    }

}

