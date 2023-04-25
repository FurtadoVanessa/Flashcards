import SwiftUI

struct ContentView: View {
    let cards: [(card: CardViewModel, color: Color)]
    var body: some View {
        VStack {
            Spacer()

            ZStack {
                ForEach(0..<cards.count) {
                    CardView(card: cards[$0].card, backgroundColor: cards[$0].color)
                        .padding(20).shadow(radius: 3)
                        .offset(x: $0 > 2 ? -CGFloat($0 - 2) * 10.0 : 0,
                                y: 0)
                }
            }.padding(.leading)
            
            HStack {
                Spacer()
                Button(action: previousQuestionAction, label: {
                    Text("←").font(.title).fontWeight(.heavy).padding(18).foregroundColor(Color.white).background(Color.gray)
                        .clipShape(Circle())
                })
                Spacer()
                Button(action: wrongAnswerAction, label: {
                    Text("X").font(.title).fontWeight(.heavy).padding(20).foregroundColor(Color.red).background(Color.white)
                        .clipShape(Circle())
                })
                Spacer()
                Button(action: rightAnswerAction, label: {
                    Text("✓").font(.title).fontWeight(.heavy).padding(18).foregroundColor(Color.green).background(Color.white)
                        .clipShape(Circle())
                })
                Spacer()
                Button(action: nextQuestionAction, label: {
                    Text("→").font(.title).fontWeight(.heavy).padding(18).foregroundColor(Color.white).background(Color.gray)
                        .clipShape(Circle())
                })
                Spacer()
            }.padding(.horizontal)
            Spacer()
        }.background(Color.orange)
    }
}

extension ContentView {
    func previousQuestionAction() {
        print("Previous question action")
    }
    
    func nextQuestionAction() {
        print("Next question action")
    }
    
    func rightAnswerAction() {
        print("Right answer action")
    }
    
    func wrongAnswerAction() {
        print("Wrong answer action")
    }
}

struct ContentView_Previews: PreviewProvider {
    static let group = Group(
        name: "iOS Questions",
        cards: [
            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient.")
        ]
    )
    static let colors: [Color] = [.blue, .red, .green, .purple, .yellow, .blue]
    
    static var previews: some View {
        ContentView(cards: group.cards.enumerated().map { index, card in
            (CardViewModel(groupName: group.name, cardIndex: index+1, groupCount: group.cards.count, question: card.question, answer: card.answer), colors[index])
        })
    }
}

struct CardViewModel {
    let groupName: String
    let cardIndex: Int
    let groupCount: Int
    let question: String
    let answer: String
}

struct CardView: View {
    
    let card: CardViewModel
    let backgroundColor: Color
    @State var subtitleText: String = ""
    @State var click = false
    
    var body: some View {
        Button(action: {
            if click {
                subtitleText = ""
            } else {
                subtitleText = card.answer
            }
            click.toggle()
            
        }, label: {
            VStack() {
                HStack {
                    Text(card.groupName).fontWeight(.semibold).padding(20).foregroundColor(Color.white)
                    Spacer()
                    Text("\(card.cardIndex)/\(card.groupCount)").padding(20).foregroundColor(Color.white)
                }
                Spacer()
                Text(card.question)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white).padding(.horizontal).multilineTextAlignment(.leading)
                Spacer()
                Text(subtitleText)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white).padding(.horizontal).multilineTextAlignment(.leading)
                Spacer()
                Text("Tap to flip").foregroundColor(Color.white).padding(.bottom)
                
            }.background(backgroundColor).cornerRadius(24)
        })
    }
}
