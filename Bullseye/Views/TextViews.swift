//
//  TextViews.swift
//  Bullseye
//
//  Created by Анатолий Фетелеу on 13.06.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    let text: String
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .lineSpacing(3)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.black)
            .font(.title)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .bold()
            .lineSpacing(15)
            .multilineTextAlignment(.center)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .font(.body)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "42")
            SliderLabelText(text: "1")
            SliderLabelText(text: "100")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
                .padding()
            BigBoldText(text: "leaderboard")
        }
    }
}
