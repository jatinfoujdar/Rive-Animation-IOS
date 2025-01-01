import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView{
                content
            }
        }
    }
    var content : some View{
        VStack(alignment: .leading ,spacing: 0){
            Text("Courses")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(courses) { course in
                        VcardView(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            Text("Recent")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal,20)
            
            VStack {
                ForEach(courseSections){ section in
                    HcardView(section: section)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeView()
}
