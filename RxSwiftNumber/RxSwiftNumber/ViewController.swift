//
//  ViewController.swift
//  RxSwiftNumber
//
//  Created by HomerIce on 2017/6/17.
//  Copyright © 2017年 HomerIce. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var result: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = CaculatorViewModel(input: (number1: number1.rx.text.orEmpty.asDriver(), number2: number2.rx.text.orEmpty.asDriver(), number3: number3.rx.text.orEmpty.asDriver()))
        
        viewModel.caculatorResultDriver
            .drive(result.rx.text)
            .addDisposableTo(disposeBag)
    }

}

