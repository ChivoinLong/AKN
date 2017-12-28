//
//  AddNewsViewController.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/27/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit

class AddNewsViewController: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var imagePicker = UIImagePickerController()
    
    var articlePresenter: ArticlePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
//        articlePresenter = ArticlePresenter()
//        articlePresenter?.delegate = self
        
        titleTextField.delegate = self
        descriptionTextView.delegate = self
        
    }

    @IBAction func didTouchAddPhotoButton(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didTouchPostButton(_ sender: Any) {
        
    }
    
}

extension AddNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newsImageView.image = pickedImage
            newsImageView.isHidden = false
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension AddNewsViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionTextView.becomeFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        if (textView.text == "Descriptions") {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            textView.text = "Descriptions"
            textView.textColor = .lightGray
        }
    }
    
}
