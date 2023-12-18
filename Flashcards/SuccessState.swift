//
//  SuccessState.swift
//  Flashcards
//
//  Created by Cristiano Fagundes on 17/12/23.
//

import Foundation
import SwiftUI


struct SuccessState: View {
    var card: CardViewObject
    var onEvent: (FlashCardEvents) -> Void
    
    
    var body: some View {
        VStack {
            CardView(
                props: card.toProps(),
                actions: FlashCardActions(onClick: { onEvent(FlashCardEvents.OnCardClickedAction) })
            ).padding(20)
            .shadow(radius: 3)
            .background(Color.black)
            
            HStack {
                Spacer()
                Button(
                    action: { onEvent(FlashCardEvents.PreviousQuestion) },
                    label: {
                        Text("←")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(18)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                )
                Spacer()
                Button(
                    action: { onEvent(FlashCardEvents.WrongAnswerAction) },
                    label: {
                        Text("X")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(20)
                            .foregroundColor(Color.red)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                )
                Spacer()
                Button(
                    action: { onEvent(FlashCardEvents.RightAnswerAction) },
                    label: {
                        Text("✓")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(18)
                            .foregroundColor(Color.green)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                )
                Spacer()
                Button(
                    action: { onEvent(FlashCardEvents.NextQuestionAction) },
                    label: {
                        Text("→")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(18)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                )
                Spacer()
            }.padding(.horizontal)
            Spacer()
        }.background(Color.orange)
        
    }
}
