import SwiftUI

struct ContentView: View {
    @AppStorage("selectTab") var selectTab : Tab = .chat
    var body: some View {
        ZStack{
            Group{
                switch selectTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom){
                Color.clear.frame(height: 80)
            }
            
            TapBarView()
        }
    }
}

#Preview {
    ContentView()
}
