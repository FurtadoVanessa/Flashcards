//
//  FlashCardState.swift
//  Flashcards
//
//  Created by Cristiano Fagundes on 17/12/23.
//

import Foundation


enum FlashCardState {
    
    case loading
    case error
    case success(card: CardViewObject)
}
