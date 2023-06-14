//
//  ContentView.swift
//  Bullseye
//
//  Created by Анатолий Фетелеу on 11.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                BackgroundView(game: $game)
                    .padding(.top, 0.5)
            } else {
                BackgroundView(game: $game)
            }
            VStack {
                InstructionView(game: $game, text: "🎯🎯🎯 \nPut the bullseye as close as you can to").padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    ButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue).padding(.bottom, 20)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    var text: String
    
    var body: some View {
        VStack {
            InstructionText(text: text)
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
                .padding(.bottom, 1)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct ButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit me".uppercased())
                .font(.title3)
                .bold()
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        // dark mode
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
