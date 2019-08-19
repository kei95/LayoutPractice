//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
    let subView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    let blueView1: UIView = {
       let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let blueView2: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let blueView3: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let rightTopView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let subRightTopView1: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let subRightTopView2: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    
    blueView1.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueView1.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
    blueView3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    blueView3.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    mainView.addSubview(subView)
    mainView.addSubview(blueView1)
    mainView.addSubview(blueView2)
    mainView.addSubview(blueView3)
    mainView.addSubview(rightTopView)
    rightTopView.addSubview(subRightTopView1)
    rightTopView.addSubview(subRightTopView2)
    
    let stackView = UIStackView(arrangedSubviews: [blueView1, blueView2, blueView3])
    
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.spacing = 50
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    mainView.addSubview(stackView)

        
    stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    stackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.8).isActive = true

    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    subView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    subView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16).isActive = true
    
    subView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
    subView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1).isActive = true
    
    rightTopView.widthAnchor.constraint(equalToConstant:200).isActive = true
    rightTopView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    rightTopView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    rightTopView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16).isActive = true
    
    subRightTopView1.topAnchor.constraint(equalTo: rightTopView.topAnchor, constant: 10).isActive = true
    subRightTopView1.widthAnchor.constraint(equalTo: rightTopView.widthAnchor, multiplier: 0.6).isActive = true
    subRightTopView1.heightAnchor.constraint(equalTo: rightTopView.heightAnchor, multiplier: 0.7).isActive = true
    subRightTopView1.leadingAnchor.constraint(equalTo: rightTopView.leadingAnchor, constant: 10).isActive = true
    
    subRightTopView2.topAnchor.constraint(equalTo: rightTopView.topAnchor, constant: 10).isActive = true
    subRightTopView2.widthAnchor.constraint(equalTo: rightTopView.widthAnchor, multiplier: 0.2).isActive = true
    subRightTopView2.heightAnchor.constraint(equalTo: rightTopView.heightAnchor, multiplier: 0.7).isActive = true
    subRightTopView2.trailingAnchor.constraint(equalTo: rightTopView.trailingAnchor, constant: -10).isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}
