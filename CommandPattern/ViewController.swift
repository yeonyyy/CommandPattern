//
//  ViewController.swift
//  CommandPattern
//
//  Created by rayeon lee on 2020/12/16.
//  Copyright © 2020 ryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let robotInveker : Invoker = Invoker()
        robotInveker.addCommand(command: MoveForwardCommand(robot: Robot(),space: 1))
        robotInveker.addCommand(command: PickupCommand(robot: Robot()))
        robotInveker.addCommand(command: TurnCommand(robot: Robot(),direction: Robot.Direction.Left))
        robotInveker.addCommand(command: TurnCommand(robot: Robot(),direction: Robot.Direction.Left))

        robotInveker.start()
    
    
    }


}

