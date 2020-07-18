//
//  PopItemView.swift
//  LeagueOfWalk
//
//  Created by 김광수 on 2020/07/18.
//  Copyright © 2020 김광수. All rights reserved.
//

import UIKit

class PopItemVC: UIViewController {
  
  // MARK: - Properties
  var itemButton:UIButton?
  var originX:CGFloat?
  var originY:CGFloat?
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "New Item!"
    label.textAlignment = .center
    label.font = UIFont(name: CommonUI.CustonFonts.enFont.rawValue, size: CommonUI.FontSize.Large.rawValue)
    label.textColor = CommonUI.edgeColor
    label.backgroundColor = CommonUI.backgroundColor
    return label
  }()
  
  let itemImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "3075") //3384
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.backgroundColor = CommonUI.pointColor
    return imageView
  }()
  
  let itemNameLabel: UILabel = {
    let label = UILabel()
    label.text = "삼위일체"
    label.font = .boldSystemFont(ofSize: 13)
    label.textAlignment = .center
    label.font = UIFont(name: CommonUI.CustonFonts.enFont.rawValue, size: CommonUI.FontSize.Large.rawValue)
    label.textColor = CommonUI.edgeColor
    label.sizeToFit()
    return label
  }()
  
  lazy var okButton: UIButton = {
    let button = UIButton()
    button.setTitle("확인", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20)
    button.backgroundColor = .darkGray
    
    button.setTitleColor(Standard.textColor, for: .normal)
    button.setTitleColor(.lightGray, for: .disabled)
    
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.addTarget(self, action: #selector(handleokButton(_:)), for: .touchUpInside)
    return button
  }()
  
  let itemaBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = CommonUI.edgeColor
    return view
  }()

  
  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .clear
    
    
    configureAutoLayoyut()
  }
  
  private func configureAutoLayoyut() {
    
    //    let viewWidth = view.frame.size.width
    //    let ratio = viewWidth / view.frame.size.height // 현재 기기의 비율
    
    view.layoutMargins = UIEdgeInsets.init(top: 190, left: 80, bottom: 190, right: 80)
    let marginGuide = view.layoutMarginsGuide
    //
    let safeGuide = view.safeAreaLayoutGuide
    
    [itemaBackgroundView].forEach{
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    [titleLabel, itemImageView, itemNameLabel, okButton].forEach{
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      
      itemaBackgroundView.topAnchor.constraint(equalTo: marginGuide.topAnchor,constant: -3),
      itemaBackgroundView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: -3),
      itemaBackgroundView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 3),
      itemaBackgroundView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 3),
      
      titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 50),
      
      itemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      
      itemNameLabel.bottomAnchor.constraint(equalTo: itemImageView.bottomAnchor),
      itemNameLabel.heightAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 0.2),
      
      okButton.topAnchor.constraint(equalTo: itemImageView.bottomAnchor),
      okButton.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor),
      okButton.heightAnchor.constraint(equalTo: itemNameLabel.heightAnchor, multiplier: 1)
    ])
    
  }
  
  // MARK: - handler
  
  @objc func handleokButton(_ sender: UIButton) {
    
    guard let itemButton = self.itemButton,
           let originX = self.originX,
           let originY = self.originY else { return }
    
//    itemButton.center.x = originX
//    itemButton.center.y = originY + 150
    
    print("tap handle ok Button")
    dismiss(animated: true) {

      UIView.animate(withDuration: 1) {
        UIView.animateKeyframes(withDuration: 1, delay: 0, animations: {
          UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
            itemButton.center.y = originY + 150
            itemButton.center.x = originX
          }
          UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
            itemButton.center.y -= 150
            itemButton.alpha = 1
          }
        })
      }
    }
  }
  
  
}
