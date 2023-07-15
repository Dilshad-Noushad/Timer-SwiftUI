//
//  ViewModel.swift
//  Timer
//
//  Created by Dilshad N on 19/05/23.
//

import Foundation
import SwiftUI
import Combine

// Signing & Capabilities -> Background modes

class ViewModel: ObservableObject {
    @Published var count: Int = 0
    var anyCancellable: AnyCancellable?
    
    ///  Function to start timer
    func start() {
        anyCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.count += 1
            })
    }
    
    ///  Function to Stop timer
    func stop() {
        anyCancellable = nil
    }
    
}

