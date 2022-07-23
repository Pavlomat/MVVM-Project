//
//  ViewController.swift
//  MVVM Project
//
//  Created by Pavlov Matvey on 23.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    
    override func viewDidLoad() {
        
        viewModel = MainViewModel()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createView()
        upfateView()
    }

private func createView() {
        testView = TestView()
    testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    testView.center = view.center
    view.addSubview(testView)
    }
    
    private func upfateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    @IBAction func startAction(_ sender: Any) {
        viewModel.startFetch()
    }
    

}

