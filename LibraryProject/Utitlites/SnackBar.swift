//
//  SnackBar.swift
//  solutionplusUtilities
//
//  Created by yusef naser on 3/10/21.
//  Copyright © 2021 solutionPlus. All rights reserved.
//

import TTGSnackbar

open class SnackBar {
    
    public static let instance  = SnackBar()
    private let snack = TTGSnackbar()
    
    public func setMessage (_ message : String ) {
        snack.message = message
        snack.duration = TTGSnackbarDuration.middle
        snack.show()
    }
    
}
