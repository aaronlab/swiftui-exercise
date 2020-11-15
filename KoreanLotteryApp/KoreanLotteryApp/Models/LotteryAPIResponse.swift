//
//  LotteryAPIResponse.swift
//  KoreanLotteryApp
//
//  Created by Aaron Lee on 2020-11-15.
//

import Foundation

struct LotteryAPIResponse: Decodable {
    let drwNo: Int
    let drwNoDate: String
    
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    let totSellamnt: Int
    let firstPrzwnerCo: Int
    let firstAccumamnt: Int
    let firstWinamnt: Int
}
