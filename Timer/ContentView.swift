//
//  ContentView.swift
//  Timer
//
//  Created by Dilshad N on 27/12/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State private var isRunning: Bool = false
    
    
    var hours: Int {
        vm.count / 3600
    }
    
    var minutes: Int {
        (vm.count % 3600) / 60
    }
    
    var seconds: Int {
        vm.count % 60
    }
    
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea()
            
            VStack {
                HStack {
                    TimeUnitView(time: hours, timeFormat: "HR")
                    Text(":")
                        .foregroundColor(Color("buttonColor"))
                        .font(.system(size: 50, design: .serif))
                        .offset(y: -19)
                    TimeUnitView(time: minutes, timeFormat: "MIN")
                    Text(":")
                        .foregroundColor(Color("buttonColor"))
                        .font(.system(size: 50, design: .serif))
                        .offset(y: -19)
                    
                    TimeUnitView(time: seconds, timeFormat: "SEC")
                    
                }
                
                HStack(spacing: 25) {
                    // Start/Stop Button
                    Button {
                        isRunning ? self.vm.stop()  : self.vm.start()
                        
                        withAnimation(.easeInOut) {
                            self.isRunning.toggle()
                        }
                        
                    } label: {
                        Text(isRunning ? "Pause" : "Start" )
                            .font(.system(size: 30, weight: .heavy, design: .serif))
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(btnColor())
                    
                    // Reset Button
                    Button {
                        vm.count = 0
                    } label: {
                        Text("Reset")
                            .font(.system(size: 30, weight: .heavy, design: .serif))
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray.opacity(0.7))
                    // .controlSize(.large)
                }
            }
        }
        
    }
    
    func btnColor() -> Color {
        if isRunning {
            return .green.opacity(0.8)
        }
        return Color("buttonColor")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - String Extension
extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}

