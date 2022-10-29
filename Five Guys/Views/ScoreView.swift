//
//  HistoryView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var handler: PageHandler
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        BackIcon()
                            .onTapGesture {
                                withAnimation {
                                    handler.page = .home
                                }
                            }
                        Spacer()
                    }
                    
                    Subtitle("HISTORY")
                }
                ScrollView {
                    
                    Subtitle("\(LevelInfo.current.num - 1) levels completed")
                    Subtitle("\(totalLevels + 1 - LevelInfo.current.num) remained")
                    ForEach(LevelInfo.levels, id:\.num) { level in
                        ScoreField(level.num, level.tap).padding()
                    }
                }
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}