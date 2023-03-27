//
//  Lokality.swift
//  pocasie
//
//  Created by Daniel Németh on 21/12/2022.
//

import Foundation

struct Lokality: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}

