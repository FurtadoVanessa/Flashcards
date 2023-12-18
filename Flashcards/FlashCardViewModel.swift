//
//  FlashCardViewModel.swift
//  Flashcards
//
//  Created by Cristiano Fagundes on 17/12/23.
//

import Foundation





class FlashCardViewModel: ObservableObject {
    
    var cards: [CardViewObject] = []
    
    
    @Published
    var state: FlashCardState = FlashCardState.success(card: CardViewObject(groupName: "Bio", cardIndex: 1, groupCount: 10, question: "Question?", answer: ""))
    
    
    private var currentCard: CardViewObject? = nil
    
    
    func onEvent(event: FlashCardEvents) {
        
        switch event {
        case .OnCardClickedAction:
            if case let .success(card) = state {
                let answer = card.answer == "" ? "IDK" : ""
                state = FlashCardState.success(card: CardViewObject(groupName: card.groupName, cardIndex: card.cardIndex, groupCount: card.groupCount, question: card.question, answer: answer))
            } else {
                state = FlashCardState.error
            }
        case .PreviousQuestion:
            state = FlashCardState.error
        case .WrongAnswerAction:
            state = FlashCardState.error

        case .RightAnswerAction:
            state = FlashCardState.error
        case .NextQuestionAction:
            state = FlashCardState.error

        }
    }
    
}
