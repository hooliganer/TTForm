//
//  TTFormController.swift
//  FBSnapshotTestCase
//
//  Created by sdfy on 2020/6/22.
//

import UIKit
import SnapKit

class TTFormController: UIViewController {
    
    var dataArray : [FormSection] = []
    var mainCollection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        mainCollection = .init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(mainCollection)
        let top = (navigationController == nil) ? 0 : TTNavigationBarHeight
        mainCollection.snp.makeConstraints { (make) in
            make.top.equalTo(top)
            make.left.right.bottom.equalToSuperview()
        }
        mainCollection.dataSource = self
        mainCollection.delegate = self
        
        mainCollection.register(BaseCell.self, forCellWithReuseIdentifier: BaseCellID)
        mainCollection.register(BaseHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: BaseHeaderID)
    }

    let BaseCellID = "BaseCellIdentifer"
    let BaseHeaderID = "BaseHeaderIdentifer"
    
    
}

//MARK: Configure Cell
extension TTFormController {
    
    func normalCell(indexPath:IndexPath,collectionView:UICollectionView? = nil) -> BaseCell {
        let collection = collectionView ?? mainCollection!
        return collection.dequeueReusableCell(withReuseIdentifier: BaseCellID, for: indexPath) as! BaseCell
    }
    
    func normalHeader(indexPath:IndexPath,collectionView:UICollectionView? = nil) -> BaseHeader {
        let collection = collectionView ?? mainCollection!
        return collection.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: BaseHeaderID, for: indexPath) as! BaseHeader
    }
}

//MARK: All Cells and Header/Footer
extension TTFormController {
    class BaseCell: UICollectionViewCell {
        
    }
    class BaseHeader: UICollectionReusableView {
        
    }
}

//MARK: UICollectionView Protocol
extension TTFormController : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataArray[indexPath.section].items[indexPath.item]
        switch item.style {
        case .normal:
            return normalCell(indexPath: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = dataArray[indexPath.section]
        switch item.style {
        case .normal:
            return normalHeader(indexPath: indexPath)
        }
    }
    
}

//MARK: All Models
extension TTFormController {
    struct FormSection {
        var title : String?
        var style = Style.normal
        var items : [FormItem] = []
        enum Style {
            case normal
        }
    }
    struct FormItem {
        var title : String?
        var style = Style.normal
        enum Style {
            case normal
        }
    }
}
