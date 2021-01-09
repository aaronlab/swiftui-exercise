//
//  RequestBuilder.swift
//  APITest
//
//  Created by Aaron Lee on 2021-01-09.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
