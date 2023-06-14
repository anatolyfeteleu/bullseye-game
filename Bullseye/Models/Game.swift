//
//  Game.swift
//  Bullseye
//
//  Created by Анатолий Фетелеу on 11.06.2022.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var round = 1
    var score = 0
    var target = Int.random(in: 1...100)
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 10, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date() + 1 * 60))
            leaderboardEntries.append(LeaderboardEntry(score: 30, date: Date() + 2 * 60))
            leaderboardEntries.append(LeaderboardEntry(score: 40, date: Date() + 3 * 60))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date() + 4 * 60))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let bonus: Int
        let difference = abs(sliderValue - target)
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries = leaderboardEntries.sorted { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
