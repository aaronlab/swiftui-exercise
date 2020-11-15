//
//  HomeView.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel(drwNo: "")
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            TextField("회차 입력 후 엔터", text: $viewModel.drwNo, onEditingChanged: { _ in }, onCommit: {
                viewModel.getLotteryResult()
            })
            .keyboardType(.numberPad)
            .frame(height: 52)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke()
            )
            
            // INFO
            Group {
                Text("회차: \(viewModel.response?.drwNo ?? 0)")
                Text("날짜: \(viewModel.response?.drwNoDate ?? "")")
            }
            
            // NUMBERS
            Group {
                Text("1번: \(viewModel.response?.drwtNo1 ?? 0)번")
                Text("2번: \(viewModel.response?.drwtNo2 ?? 0)번")
                Text("3번: \(viewModel.response?.drwtNo3 ?? 0)번")
                Text("4번: \(viewModel.response?.drwtNo4 ?? 0)번")
                Text("5번: \(viewModel.response?.drwtNo5 ?? 0)번")
                Text("6번: \(viewModel.response?.drwtNo6 ?? 0)번")
                Text("보너스: \(viewModel.response?.bnusNo ?? 0)번")
            }
            
            // MONEY
            Group {
                Text("총 판매: \(viewModel.response?.totSellamnt ?? 0)원")
                Text("1등 총 인원: \(viewModel.response?.firstPrzwnerCo ?? 0)원")
                Text("1등 총 당첨금: \(viewModel.response?.firstAccumamnt ?? 0)원")
                Text("1등 1인당 당첨금: \(viewModel.response?.firstWinamnt ?? 0)원")
            }
            
        }.padding(16)
    }
    
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
