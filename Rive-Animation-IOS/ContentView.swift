import SwiftUI

struct ContentView: View {
    @AppStorage("selectTab") var selectTab : Tab = .chat
    var body: some View {
        ZStack{
            switch selectTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }
            TapBarView()
        }
    }
}

#Preview {
    ContentView()
}
