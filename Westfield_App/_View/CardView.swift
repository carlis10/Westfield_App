import SwiftUI

struct CardView: View {
    @State var width: CGFloat
    @State var height: CGFloat
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var ImageFront: Image?
    @State var flip : Bool

    let durationAndDelay: CGFloat = 0.5

    func flipCard (){
        withAnimation(.linear(duration: durationAndDelay)){
            backDegree = 90
        }
        withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
            frontDegree = 0
        }
    }

    var body: some View {
        ZStack{
            FrontCard(CartaImg: ImageFront!,degree: $frontDegree,width: width,height: height)
                
            BackCard(degree: $backDegree,width: width,height: height)
        }.onAppear(){
            if flip{
                flipCard()
            }
        }
        
    }
}

struct FrontCard: View {
    @State var CartaImg: Image
    @Binding var degree: Double
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View{
        CartaImg
            .resizable()
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            .frame(width: width, height: height)
    }
}

struct BackCard: View{
    @State var backCard: Image = Image("Back-Card")
    @Binding var degree: Double
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View{
        backCard
            .resizable()
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            .frame(width: width, height: height)
    }
}
