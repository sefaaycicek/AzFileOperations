//
//  ViewController.swift
//  AzFileOperations
//
//  Created by Sefa Aycicek on 13.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadsPath = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let cachePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        print(documentPath)
        print(cachePath)
        
        let metin = "Ali veli"
        let image = UIImage(named: "ic_background")
        
        let data = metin.data(using: .utf8)
        let txtFile = cachePath?.appending(component: "default.txt")
        
        // txt dosya yaz
        if let txtFile = txtFile, let data = data {
            try? data.write(to: txtFile)
        }
        
        // image yaz
        let imageFile = cachePath?.appending(component: "image.jpg")
        if let imageData = image?.jpegData(compressionQuality: 1.0) {
            if let imageFile = imageFile {
                try? imageData.write(to: imageFile)
            }
        }
        
        // path'deki image'i data olarak alıp UIImage'e dönüştür
        if let imageFile = imageFile {
            if let newImageData = try? Data(contentsOf: imageFile) {
                let newImage = UIImage(data: newImageData)
            }
            
        }
        
        if let imageFile = imageFile {
            //if FileManager.default.fileExists(atPath: imageFile.absoluteString) {
            try? FileManager.default.removeItem(at: imageFile)
            //}
            
        }
        
        if let downloadsPath = downloadsPath?.absoluteString {
            let fileList = try? FileManager.default.contentsOfDirectory(atPath: downloadsPath)
            print(fileList)
        }
        
        
        
    }

}

