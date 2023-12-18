import SwiftUI

struct ContentView: View {
        
    @ObservedObject var viewModel: FlashCardViewModel
    
    var body: some View {
        VStack {
            switch viewModel.state {
                case .loading:
                    ProgressView("Loading...")
        
                case .error:
                    Text("Oops. Something went wrong.")
        
                case .success(let data):
                    SuccessState(card: data, onEvent: viewModel.onEvent)
                
            }
        }
    }
}

extension CardViewObject {
    
    func toProps() -> FlashCardProps {
        return FlashCardProps(
            id: "ID",
            groupName: self.groupName,
            cardIndex: self.cardIndex,
            groupCount: self.groupCount,
            question: self.question,
            answer: self.answer ?? ""
        )
    }
}

//struct ContentView_Previews: PreviewProvider {
//    typealias Previews = <#type#>
//    
//    static let group = Group(
//        name: "iOS Questions",
//        cards: [
//            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
//            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
//            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient."),
//            Card(question: "What is QoS in iOS and how to define which one to use?", answer: "A quality-of-service (QoS) class categorizes work to perform on a DispatchQueue. By specifying the quality of a task, you indicate its importance to your app. When scheduling tasks, the system prioritizes those that have higher service classes. Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive and energy efficient.")
//        ]
//    )
//    static let colors: [Color] = [.blue, .red, .green, .purple, .yellow, .blue]
//    
//    static let cardViewModel = group.cards.enumerated().map { index, card in
//        (FlashCardProps(id: group.name, subtitleText: "Subtitle text", groupName: group.name, cardIndex: index+1, groupCount: group.cards.count, question: card.question, answer: card.answer), colors[index])
//    }
////    static var previews: some View {
//////        ContentView(cards: cardViewModel.reversed())
////    }
//}
