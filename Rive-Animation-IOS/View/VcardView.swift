import SwiftUI

struct VcardView: View {
    var course : Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .opacity(0.7)
            Text(course.caption.uppercased())
                .font(.caption)
                .fontWeight(.bold)
            Spacer()
            HStack {
                Image("Avatar 1")
                    .resizable()
                    .frame(width : 44,height: 44)
                    .mask(Circle())
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.yellow.opacity(0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            course.image
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                .padding()
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 10) 
    }
}

#Preview {
    VcardView(course: courses[0])
}
