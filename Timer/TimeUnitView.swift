//
//  DemoView.swift
//  Timer
//
//  Created by Dilshad N on 19/05/23.
//

import SwiftUI

struct TimeUnitView: View {
    var time: Int
    var timeFormat: String
    
    /// Time unit expressed as String.
    /// - Includes "0" as prefix if this is less than 10.
    var timeUnit: String {
        let timeUnit = String(time)
        return time < 10 ? "0" + timeUnit : timeUnit
    }
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .fill(.white)
                    .frame(width: 75, height: 75, alignment: .center)
                HStack(spacing: 2) {
                    Text(timeUnit.substring(index: 0))
                        .font(.system(size: 50, design: .serif))
                        .frame(width: 30)
                    
                    Text(timeUnit.substring(index: 1))
                        .font(.system(size: 50, design: .serif))
                        .frame(width: 30)
                }
            }
            
            Text(timeFormat)
                .font(.system(size: 20))
        }
        .foregroundColor(.white)
    }
}

struct TimeUnitView_Previews: PreviewProvider {
    static var previews: some View {
        TimeUnitView(time: 10, timeFormat: "HR")
            .preferredColorScheme(.dark)
    }
}


