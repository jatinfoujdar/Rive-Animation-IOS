import SwiftUI
import GoogleGenerativeAI

struct GeminiChatView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: ApiKey.default)
    
    @State var userPrompt = ""
    @State var response = "How can I help you today?"
    @State var isLoading = false
    
    var body: some View {
        VStack {
            Text("Welcome to Gemini Ai")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ZStack{
                ScrollView{
                    Text(response)
                        .font(.title)
                }
                if isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(4)
                }
            }
            TextField("Ask Anything...", text: $userPrompt, axis: .vertical)
                .lineLimit(5)
                .font(.title)
                .padding()
                .background(Color.indigo.opacity(0.2), in: Capsule())
                .disableAutocorrection(true)
                .onSubmit {
                    generateResponse()
                }
        }
        .padding()
    }
    func generateResponse(){
        isLoading = true
        response = ""
        
        Task{
            do{
                let result = try await model.generateContent(userPrompt)
                isLoading = false
                response = result.text ?? "NO response Found"
                userPrompt = ""
            }
            catch{
                response = "somthig went wrong"
            }
        }
    }
}

#Preview {
    GeminiChatView()
}
