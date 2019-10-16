//
//  FavoriteImageView.swift
//  Ku
//
//  Created by Abraham Escamilla Pinelo on 09/04/18.
//  Copyright © 2018 Dacodes. All rights reserved.
//

import UIKit

protocol FavoriteImageViewDelegate: class {
    
    func favoriteImageView(_ favImageView: FavoriteImageView, didTapped isFavorite: Bool)
}

class FavoriteImageView: UIImageView {
    
    //MARK: - Variables
    
    var isFavorite = false
    weak var delegate: FavoriteImageViewDelegate?
    
    var fullImage = #imageLiteral(resourceName: "FillFavIcon")
    var emptyImage = #imageLiteral(resourceName: "EmptyFavIcon")
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.setup()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        fatalError("No implementado")
    }
    
    //MARK: - Helper
    
    func setFavoriteState(_ fav: Bool) {
        self.isFavorite = fav
        self.changeStateImage()
    }
    
    private func setup() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedAction(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
        self.image = self.emptyImage
    }
    
    private func changeStateImage() {
        self.image = self.isFavorite ? self.fullImage : self.emptyImage
    }
    
    //MARK: - Actions
    
    @IBAction func tappedAction(_ gesture: UITapGestureRecognizer) {
        
        self.isFavorite = !self.isFavorite
        UIView.transition(with: self,
                          duration:0.3,
                          options: [.transitionCrossDissolve],
                          animations: { self.changeStateImage() },
                          completion: nil)
        
        self.delegate?.favoriteImageView(self, didTapped: self.isFavorite)
    }

}
