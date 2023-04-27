import SwiftUI
@available(iOS 15.0, *) // For Slider's min & max labels

// Frame found at https://publicdomainvectors.org/en/free-clipart/Gloss-transparent-green-frame-vector-image/25937.html

struct Exercise: View {
    @State var myToggle = true
    @State var sliderValue = 20.0
    @State var color: Color = .white
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 10*sliderValue, height: 15*sliderValue)
                    .foregroundColor(myToggle ? color : .mint)
                Image("Green-Frame")
                    .resizable()
                    .frame(width: 10.5*sliderValue, height: 16.5*sliderValue)
            }
                .frame(width:200, height: 300)
                .padding()
            
            Toggle(myToggle ? "Custom" : "Mint", isOn: $myToggle)
                .frame(width: 250)
                .padding()

            VStack {
                Stepper(value: $sliderValue, in: 1...20) {
                                Text("Stepper value = \(sliderValue)")
                    
                            }.padding()
            }.padding()
            
            VStack {
                
                Text("Slider value = \(sliderValue)")
                Slider(value: $sliderValue, in: 1...20)
                Text("Adjust the size of the image")
                Spacer()
            }
        }
        .onChange(of: sliderValue/20) { newValue in
            color = Color(red: newValue, green: 1 - newValue, blue: 0 + sliderValue)
        }
        .padding()
    }
}
struct ExercisePreviews: PreviewProvider {
    static var previews: some View {
        Exercise()
    }
}
