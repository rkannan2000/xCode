//
//  EmployeeLoginController.swift
//  VisitorCenter
//
//  Created by Aakash on 10/07/15.
//  Copyright (c) 2015 Aakash. All rights reserved.
//

import UIKit

class EmployeeLoginController: UIViewController {

	@IBOutlet var messageLabel: UILabel!
	@IBOutlet var button: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
		SFAuthenticationManager.sharedManager().loginWithCompletion({
			(info) -> Void in
				self.log(SFLogLevelInfo, msg: "Completed login: \(info)")
				self.log(SFLogLevelInfo, msg: SFAuthenticationManager.sharedManager().idCoordinator.idData.userType)
				self.performSegueWithIdentifier("EmployeeLoggedinSegue", sender: self)
			},
			failure: { (info, err) -> Void in
				self.log(SFLogLevelError, msg: "Failed login: ERR: \(err) INFO: \(info)")
				self.messageLabel.text = "Failed!"
				self.button.enabled = true
				self.button.hidden = false
				UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
			}
		)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
