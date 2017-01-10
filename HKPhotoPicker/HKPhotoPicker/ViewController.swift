//
//  ViewController.swift
//  HKPhotoPicker
//
//  Created by Hussain Khan on 09/01/17.
//  Copyright © 2017 Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }


    @IBAction func takePhoto(_ sender: UIButton) {
        
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func selectPhoto(_ sender: UIButton) {
        
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)        
    }
}


extension ViewController:UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage{
           self.imageView.image    = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController:UINavigationControllerDelegate{
    
}

