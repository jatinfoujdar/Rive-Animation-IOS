import SwiftUI
import GoogleGenerativeAI

struct RecipeScreenWithChat: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: ApiKey.default)
    
    @State private var userPrompt = ""
    @State private var response = "Enter your ingredients and generate a recipe!"
    @State private var isLoading = false
    @State private var chatHistory: [ChatMessage] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HeaderView()
                VStack(spacing: 10) {
                    TextField("Enter your list of ingredients...", text: $userPrompt)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    Button(action: generateRecipe) {
                        HStack {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Generate Recipe")
                            }
                        }
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(userPrompt.isEmpty || isLoading)
                }
                .padding(.horizontal)
                
                // Chat Response Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Generated Recipe:")
                        .font(.headline)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(chatHistory, id: \.id) { message in
                                MessageBubble(message: message)
                            }
                            
                            if isLoading {
                                LoadingIndicator()
                            }
                        }
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color("Background")
            .ignoresSafeArea())
    }
    
    func generateRecipe() {
        let currentPrompt = "Generate a recipe with the following ingredients: \(userPrompt)"
        chatHistory.append(ChatMessage(text: userPrompt, isUser: true))
        isLoading = true
        userPrompt = ""
        
        Task {
            do {
                let result = try await model.generateContent(currentPrompt)
                
                await MainActor.run {
                    isLoading = false
                    if let responseText = result.text {
                        chatHistory.append(ChatMessage(text: responseText, isUser: false))
                        response = responseText
                    }
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    response = "Something went wrong. Please try again."
                }
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.orange]), startPoint: .top, endPoint: .bottom)
                .cornerRadius(20)
                .padding(.horizontal)
                .frame(height: 450)
            
            VStack(spacing: 15) {
                Image("chef6")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                
                Text("Warm up your stove, and let’s get cooking!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    RecipeScreenWithChat()
}
