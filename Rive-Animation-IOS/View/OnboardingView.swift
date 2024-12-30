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
            VStack(alignment: .leading, spacing: 16){
                Text("Recipe Buddy")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .frame(width: 260, alignment: .leading)
                
                Text("Recipe Buddy is your ultimate cooking companion! Simply enter a recipe, get a complete ingredient list, and add everything to your quick commerce cart with a single tap. Meal prep has never been this easy!")
                    .font(.headline)
                
                Text("Whisk it, list it, shop it—your recipe adventure starts here!")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                button.view()
                    .frame(width: 236,height: 64)
                    .overlay(
                        Label("Let’s get cookin’!",systemImage: "arrow.forward")
                            .offset(x:4,y:4)
                            .font(.headline)
                    )
                    .background(
                        Color.black
                            .cornerRadius(30)
                            .blur(radius: 10)
                            .opacity(0.3)
                            .offset(y: 10)
                    )
                    .onTapGesture {
                        button.play(animationName: "active")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
