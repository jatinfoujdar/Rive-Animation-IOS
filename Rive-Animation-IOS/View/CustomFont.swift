import SwiftUI

struct CustomFont: ViewModifier{
    func body(content: Content)-> some View{
        content.font(.custom("Inter Regular", size: 17, relativeTo: .body))
    }
}
    
extension View{
    func customFont()-> some View{
        modifier(CustomFont())
    }
}
