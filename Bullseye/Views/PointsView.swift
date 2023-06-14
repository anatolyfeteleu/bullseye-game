//
//  PointsView.swift
//  Bullseye
//
//  Created by Анатолий Фетелеу on 23.06.2022.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
            Button(action: {
                game.startNewRound(points: points)
                withAnimation {
                    alertIsVisible = false
                }
            }) {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(game: .constant(Game()), sliderValue: .constant(30.0), alertIsVisible: .constant(false))
        PointsView(game: .constant(Game()), sliderValue: .constant(30.0), alertIsVisible: .constant(false)).previewLayout(.fixed(width: 568, height: 320))
        // dark mode
        PointsView(game: .constant(Game()), sliderValue: .constant(30.0), alertIsVisible: .constant(false)).preferredColorScheme(.dark)
        PointsView(game: .constant(Game()), sliderValue: .constant(30.0), alertIsVisible: .constant(false))
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
