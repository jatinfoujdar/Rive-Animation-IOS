import SwiftUI
import RiveRuntime


struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    var body: some View {
        ZStack{
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                .background(
                    Image("Spline")
                        .blur(radius: 50)
                        .offset(x:200,y: 100)
                )
             button.view()
                .frame(width: 236,height: 64)
                .overlay(
                    Label("Start the course",systemImage: "arrow.forward")
                        .offset(x:4,y:4)
                        .font(.headline)
                )
                .onTapGesture {
                button.play(animationName: "active")
                }
        }
    }
}

#Preview {
    OnboardingView()
}
