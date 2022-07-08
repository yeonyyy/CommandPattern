//
//  CommandPattern.swift
//  CommandPattern
//
//  Created by rayeon lee on 2020/12/16.
//  Copyright © 2020 ryl. All rights reserved.
//

import Foundation

class Robot {
    enum Direction{
        case Left
        case Right
    }
    
    func moveForward(space:Int){
        print("\(space)칸 전진")
    }
    
    func turn(direction: Direction){
        print("\(direction == Direction.Left ? "왼쪽" : "오른쪽")으로 방향 전환")
    }
    
    func pick(){
        print("물건 집기")
    }
}

protocol Command : AnyObject {
    var robot : Robot {get}
    func excute()
}

class MoveForwardCommand : Command {
    var robot: Robot
    var space : Int
    init(robot:Robot, space:Int) {
        self.robot = robot
        self.space = space
    }
    
    func excute() {
        self.robot.moveForward(space: self.space)
    }
}

class TurnCommand : Command {
    var robot: Robot
    var direction : Robot.Direction
    
    init(robot:Robot, direction:Robot.Direction) {
        self.robot = robot
        self.direction = direction
    }
    
    func excute() {
        self.robot.turn(direction: direction)
    }
}

class PickupCommand : Command {
    var robot: Robot
    
    init(robot : Robot) {
        self.robot = robot
    }
    
    func excute() {
        self.robot.pick()
    }
}

class Invoker {
    var robot : Robot = Robot()
    var commands : [Command] = []
    
    func addCommand(command : Command){
        commands.append(command)
    }
    
    func start(){
        for command in commands{
            command.excute()
        }
    }
}

