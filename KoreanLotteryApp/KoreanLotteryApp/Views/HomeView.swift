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
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    TextField("회차 입력 후 엔터", text: $viewModel.drwNo)
                        .keyboardType(.numberPad)
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke()
                                
                                HStack {
                                    Spacer()
                                    Button {
                                        viewModel.getLotteryResult()
                                        self.hideKeyboard()
                                    } label: {
                                        Image(systemName: "magnifyingglass")
                                            .font(.system(size: 30))
                                            .foregroundColor(.primary)
                                    }
                                } //: HSTACK
                                .padding(16)
                            } //: ZSTACK
                        ) //: SEARCH BOX
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                } //: VSTACK
                .padding(16)
                .frame(width: geometry.size.width, height: geometry.size.height)
            } //: SCROLL
        } //: GEOMETRY
    }
    
}
