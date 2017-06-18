//
// Created by HomerIce on 2017/6/17.
// Copyright (c) 2017 HomerIce. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CaculatorViewModel {

    // input:
    let numberOneObservable: Driver<Int>
    let numberTwoObservable: Driver<Int>
    let numberThreeObservable: Driver<Int>
    
    // output:
    let caculatorResultDriver: Driver<String>

    init(input: (number1: Driver<String>, number2: Driver<String>, number3: Driver<String>)) {
        numberOneObservable = input.number1
            .map { Int($0) ?? 0 }

        numberTwoObservable = input.number2
            .map { Int($0) ?? 0 }

        numberThreeObservable = input.number3
            .map { Int($0) ?? 0 }
        
        caculatorResultDriver = Driver.combineLatest(numberOneObservable, numberTwoObservable, numberThreeObservable) { 
                return "\($0 + $1 + $2)"
            }
            .distinctUntilChanged()
        
    }
}
