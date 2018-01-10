//
//  ImageLoader.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 1/10/18.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import Foundation


class ImageLoader {
    
    private func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL, onCompletion: @escaping (Data) -> (Void) ) {
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            onCompletion(data)
        }
    }
    
    
}
