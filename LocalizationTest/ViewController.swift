//
//  ViewController.swift
//  LocalizationTest
//
//  Created by 구본의 on 2023/07/19.
//

import UIKit

extension String {
  func localized(comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
}

struct LocalizedString {
  static let TEST: String = "TEST"
  static let Hello: String = "Hello".localized()
}


class ViewController: UIViewController {

  
  private let label: UILabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.setupLabel()
    self.setupLayouts()
    
    DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: { [weak self] in
      guard let self else { return }
      self.label.text = LocalizedString.TEST.localized()
      self.label.sizeToFit()
    })
  }
  
  private func setupLabel() {
    label.font = UIFont.systemFont(ofSize: 20)
    label.text = LocalizedString.Hello
    label.sizeToFit()
  }
  
  private func setupLayouts() {
    self.view.addSubview(label)
    label.frame.origin.x = 150
    label.frame.origin.y = 150
  }
}
