import SwiftUI

struct HcardView: View {
    var section : CourseSection
    
    var body: some View {
        HStack(spacing: 8){
            VStack(alignment: .leading, spacing: 8){
                Text(section.title)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Divider()
            section.image
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(Color.blue)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

#Preview {
    HcardView(section: courseSections[0])
}
