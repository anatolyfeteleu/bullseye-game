//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Анатолий Фетелеу on 13.06.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
            .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .background(
                Text(text)
                    .foregroundColor(Color("TextColor"))
                    .bold()
                    .font(.title3)
                    .kerning(-0.2)
                    .lineSpacing(0)
            )
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Circle()
            .strokeBorder(Color("LeaderboardRowColor"),
                          lineWidth: Constants.General.strokeWidth)
            .frame(width: Constants.Leaderboard.leaderboardRoundRectViewWidth,
                   height: Constants.Leaderboard.leaderboardRoundRectViewWidth)
            .background(
                Text(text)
                    .foregroundColor(Color("TextColor"))
                    .bold()
                    .font(.title3)
                    .lineSpacing(0)
            )
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .kerning(-0.2)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .kerning(-0.2)
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 25) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "12")
            RoundedTextView(text: "1")
            ScoreText(score: 10)
            DateText(date: Date())
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
