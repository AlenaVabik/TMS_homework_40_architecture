//
//  ViewController.swift
//  TMS_hw_40_architecture
//
//  Created by Alena  on 17.02.25.
//

import UIKit

class MVVMViewController: UIViewController {

    private var viewModel: ViewModel
    private let model = Model()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder?) {
        fatalError("init(coder:) has not been implemented")
    }

    var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
     
    lazy var increaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Увеличить", for: .normal)
        button.addTarget(self, action: #selector(increaseAction), for: .touchUpInside)
        return button
    }()
    
    lazy var decreaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Уменьшить", for: .normal)
        button.addTarget(self, action: #selector(decreaseAction), for: .touchUpInside)
        return button
    }()
    
   
    
    func counterDidUpdate(counter: Int) {
        myLabel.text = "\(counter)"
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        viewModel = ViewModel(model: model)
        viewModel.delegate = self
        
        myLabel.text = "\(viewModel.getCounter())"
        view.addSubview(myLabel)
        view.addSubview(increaseButton)
        view.addSubview(decreaseButton)
        createConstraints()
        super.viewDidLoad()
    }

    func createConstraints() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        increaseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myLabel.topAnchor.constraint(equalTo: increaseButton.bottomAnchor, constant: 60).isActive = true
        decreaseButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 60).isActive = true
        decreaseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

extension MVVMViewController: ViewModelDelegate {
    @objc func increaseAction() {
        viewModel.increaseCounter()
    }
    
    @objc func decreaseAction() {
        viewModel.decreaseCounter()
    }
}


//мое базовое приложение
/*
 class BaseViewController: UIViewController {
     var counter = 0
     let min = 0
     let max = 10
     
     var myLabel: UILabel = {
         let label = UILabel()
         label.textColor = .lightGray
         label.backgroundColor = .white
         label.font = UIFont.systemFont(ofSize: 50)
         label.textAlignment = .center
         label.adjustsFontSizeToFitWidth = true
         label.minimumScaleFactor = 0.5
         return label
     }()
      
     lazy var increaseButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Увеличить", for: .normal)
         button.addTarget(self, action: #selector(increaseAction), for: .touchUpInside)
         return button
     }()
     
     lazy var decreaseButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Уменьшить", for: .normal)
         button.addTarget(self, action: #selector(decreaseAction), for: .touchUpInside)
         return button
     }()
     
     @objc func increaseAction() {
         if counter >= min && counter < max {
             counter = counter + 1
             myLabel.text = "\(counter)"
         }
     }
     
     @objc func decreaseAction() {
         if counter > min && counter <= max {
             counter = counter - 1
             myLabel.text = "\(counter)"
         }
     }
     
     override func viewDidLoad() {
         self.view.backgroundColor = .white
         myLabel.text = "\(counter)"
         view.addSubview(myLabel)
         view.addSubview(increaseButton)
         view.addSubview(decreaseButton)
         createConstraints()
         super.viewDidLoad()
     }

     func createConstraints() {
         myLabel.translatesAutoresizingMaskIntoConstraints = false
         increaseButton.translatesAutoresizingMaskIntoConstraints = false
         decreaseButton.translatesAutoresizingMaskIntoConstraints = false
         increaseButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
         increaseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
         myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
         myLabel.topAnchor.constraint(equalTo: increaseButton.bottomAnchor, constant: 60).isActive = true
         decreaseButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 60).isActive = true
         decreaseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
     }
 }
 */
