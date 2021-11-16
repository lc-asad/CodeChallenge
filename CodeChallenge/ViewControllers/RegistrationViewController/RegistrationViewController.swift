//
//  RegistrationViewController.swift
//  CodeChallenge
//
//  Created by Abu Hamdan on 11/16/21.
//

import UIKit
import RxSwift
import RxCocoa

class RegistrationViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    //Constants
    private let viewModel = RegistrationViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - UIViewController life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateUI()
        initialSetup()
        setupBindings()
    }
    
    //MARK: - Decorate UI
    private func decorateUI() {
        btnSignUp.layer.cornerRadius = 5.0
        btnSignUp.layer.borderWidth = 1.0
        btnSignUp.layer.borderColor = #colorLiteral(red: 0.8665809035, green: 0.8667266965, blue: 0.8665617108, alpha: 1)
    }
    
    //MARK: - Initial setup
    private func initialSetup() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(gesture)
        
    }
    
    // Dismiss keyboard
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    //MARK: - setup bindings
    private func setupBindings() {
        txtFullName.rx.text.map {$0 ?? ""}.bind(to: viewModel.fullNamePublishSubject).disposed(by: disposeBag)
        txtEmail.rx.text.map {$0 ?? ""}.bind(to: viewModel.emailPublishSubject).disposed(by: disposeBag)
        txtPhoneNumber.rx.text.map {$0 ?? ""}.bind(to: viewModel.phoneNumberPublishSubject).disposed(by: disposeBag)
        
        viewModel.isValid().bind(to: btnSignUp.rx.isEnabled).disposed(by: disposeBag)
        btnSignUp.rx.tap
            .bind { [weak self] in
                self?.navigateToWelcome()
            }
            .disposed(by: disposeBag)
        
    }
    
    //MARK: - navigate to Welcome
    private func navigateToWelcome() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let welcomViewController = storyboard.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
        show(welcomViewController, sender: self)
        
    }

}
