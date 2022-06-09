//
//  ImageLoaderHelper.swift
//  MessangerVK
//
//  Created by Оксана Каменчук on 15.05.2022.
//

import Foundation
import UIKit

protocol ImageLoaderHelperProtocol {
    func loadImage(url: String, completion: @escaping(UIImage) -> Void)
}

final class ImageLoaderHelper: ImageLoaderHelperProtocol {

    private let imageService: ImageLoaderServiceProtocol

    init(imageService: ImageLoaderServiceProtocol = ImageLoaderService()) {
        self.imageService = imageService
    }

    func loadImage(url: String, completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url) else { return }

        imageService.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}
