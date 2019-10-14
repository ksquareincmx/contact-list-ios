//
//  ProfilePhotoView.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 14/10/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class ProfilePhotoView: UIView {
    
    //MARK: - UI
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Properties
    var photo: UIImage? {
        didSet {
            self.setupImage()
        }
    }
    
    //MARK: - Setup
    private func setup() {
        DispatchQueue.main.async {
            self.photoImageView.circle()
        }
    }
    
    private func setupImage() {
        if let photo = photo {
            self.photoImageView.image = photo
        } else {
            self.photoImageView.image = #imageLiteral(resourceName: "PhotoPlaceholder")
        }
    }
    
    //MARK: - Creation
    let nibName = "ProfilePhotoView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    init(frame: CGRect, target: Any?, action: Selector) {
        super.init(frame: frame)
        
        xibSetup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup(){
        
        contentView = loadViewFromNib()
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        self.setup()
    }

}
