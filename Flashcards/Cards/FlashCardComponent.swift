//
//  FlashCardComponent.swift
//  Flashcards
//
//  Created by Cristiano Fagundes on 17/12/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var props: FlashCardProps
    var actions: FlashCardActions
    
    var body: some View {
        Button(
            action: actions.onClick,
            label: {
                VStack() {
                    HStack {
                        Text(props.groupName)
                            .fontWeight(.semibold)
                            .padding(20)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text(props.id)
                            .padding(20)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    Text(props.question)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(props.answer)
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Tap to flip")
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    
                }
            .cornerRadius(24)
            }
        )
    }
}
