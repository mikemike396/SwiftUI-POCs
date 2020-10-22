//
//  ContentView.swift
//  ProgressBar
//
//  Created by Komrska, Jack on 10/22/20.
//

import SwiftUI

import SwiftUI

struct ProgressHome: View {
    @State var progressValue: Float = 0.0

    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            VStack {
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)

                HStack {
                    Image(systemName: "plus.rectangle.fill")
                    Text("Increment")
                }
                .onTapGesture {
                    self.incrementProgress()
                }
                .padding(15.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                )
                
                Text("Reset")
                    .onTapGesture {
                        self.progressValue = 0
                    }
                Spacer()
            }
        }
    }

    func incrementProgress() {
//        for _ in 1...20{
//            self.progressValue += 0.05
//        }
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            self.progressValue += 0.05
            
            if self.progressValue == 1 {timer.invalidate()}
        }
    }
}
struct ProgressBar: View {
    @Binding var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .foregroundColor(Color(red: 0 / 255, green: 75 / 255, blue: 141 / 255))

            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 0 / 255, green: 175 / 255, blue: 233 / 255))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            HStack(spacing: 0){
                Text(String(format: "%.0f", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()

                Text("%")
                    .font(.body)
                    .offset(y: -5)
            }
        }
    }
}
