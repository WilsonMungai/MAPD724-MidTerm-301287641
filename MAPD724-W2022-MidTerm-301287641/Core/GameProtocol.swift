//
//  GameProtocol.swift
//  MAPD724-W2022-MidTerm-301287641
//
//  Created by Wilson Mungai on 2023-03-01.
//

import Foundation

protocol GameProtocol
{
    // Initialization
    func Start()
    
    // update every frame
    func Update()
    
    // check if the position is outside the bounds of the Screen
    func CheckBounds()
    
    // a method to reset the position
    func Reset()
}
