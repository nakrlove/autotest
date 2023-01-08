//
//  MyCollectionVC.swift
//  autotest
//
//  Created by nakrlove on 2023/01/08.
//

import UIKit

class MyCollectionVC: UIViewController {

    
    fileprivate let systemImageNameArray = [
           "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
       ]
          
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        print("MyCollectionVC - viewDidLoad() called ")
        // Do any additional setup after loading the view.
        
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
        myCollectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        //콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다
        self.myCollectionView.collectionViewLayout = createCompositionalLayout( SegumentEnumType.FONE.value,Int(SegumentEnumType.ONE.value))
        
        
        self.mySegmentControl.addTarget(self, action: #selector(segmentFunc(_:)), for: .allEvents)
    }
    

    @objc fileprivate func segmentFunc(_ sender: UISegmentedControl){
        print("MyCollectionVC - segmentFunc() called - selectedIndex= \(sender)")
        
        switch sender.selectedSegmentIndex {
        
        case 1:
            //콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다
            self.myCollectionView.collectionViewLayout = createCompositionalLayout( SegumentEnumType.FTWO.value,Int(SegumentEnumType.TWO.value))
        case 2:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(SegumentEnumType.FTHEE.value,Int(SegumentEnumType.THEE.value))
        default:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout(SegumentEnumType.FONE.value,Int(SegumentEnumType.FONE.value))
        }
       
    }
 
}


extension MyCollectionVC {
    
    //콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout(_ selectIndex: CGFloat,_ position: Int) -> UICollectionViewLayout {
        //콤포지셔널 레이아웃 생성
        
        return UICollectionViewCompositionalLayout {
            (sectionIndex: Int , layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        
            print(" >>>>>>>>> UICollectionViewCompositionalLayout - \(selectIndex) , scIndex = \(sectionIndex)")
            
            // 아이템에 대한 사이즈
            // absolute는 고정값
            // estimated는 추측
            // fractionWidth 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(selectIndex), heightDimension: .absolute(100))
            
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
           
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension )
            
            
            var arrayItems = [NSCollectionLayoutItem]()
            
            for _ in 0 ... sectionIndex {
                arrayItems.append(item)
            }
            //그룹으로 섹션 만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: arrayItems )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: position )
            
            // 섹션에 대한 견격 설정
            let section = NSCollectionLayoutSection(group: group)
            
            // 가로스크롤
//            section.orthogonalScrollingBehavior = .continuous
//            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
    }
}



extension MyCollectionVC  {
    enum SegumentEnumType{
        
        case custom(CGFloat)
        case ONE,TWO,THEE,FONE,FTWO,FTHEE
     
        
        var value: CGFloat {
            switch self {
            case .ONE :
                return 1
            case .TWO :
                return 2
            case .THEE:
                return 3
                
            case .FONE:
              return 1.0
            case .FTWO:
              return 1/2
            case .FTHEE:
              return 1/3
         
            case .custom(let customValue):
              return customValue
            }
        }
    }

}
extension MyCollectionVC: UICollectionViewDelegate {
    
    
    
}

extension MyCollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: MyCustomCollectionViewCell.self), for: indexPath) as! MyCustomCollectionViewCell
        
        cell.imageName = self.systemImageNameArray[indexPath.row]
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        cell.contentView.layer.cornerRadius = 8
//        cell.contentView.layer.borderWidth = 1
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
// 
//        cell.profileimg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
//        cell.profileLabel.text = self.systemImageNameArray[indexPath.row]
        return cell
    }
    
    
}
