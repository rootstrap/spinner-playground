//
//  SpinnerBindedView.swift
//  Spinner
//
//  Created by Pablo on 8/11/20.
//  Copyright © 2020 PaperJam. All rights reserved.
//

import SwiftUI

struct SpinnerBindedView: View {
  var configuration: SpinnerConfiguration = SpinnerConfiguration()
  @Binding var animate: Bool
  @State var isAnimating = false
  
  var body: some View {
    let multiplier = configuration.width / 40
    
    return
      ZStack {
        configuration.blurredBackground.opacity(0.8)
          .edgesIgnoringSafeArea(.all)
          .blur(radius: 200)
        
        ZStack {
          configuration.spinnerBackgroundColor.opacity(0.5)
          
          Circle()
            .trim(from: 0.2, to: 1)
            .stroke(
              Color.white,
              style: StrokeStyle(
                lineWidth: 5 * multiplier,
                lineCap: .round,
                lineJoin: .round,
                dash: [20, 0],
                dashPhase: 0
              )
            )
            .frame(width: configuration.width, height: configuration.height)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 3)
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(
              Animation.linear(duration: configuration.speed)
                .repeatForever(autoreverses: false)
            )
        }
        .frame(width: 80 * multiplier, height: 80 * multiplier)
        .background(Color.white)
        .cornerRadius(configuration.backgroundCornerRadius)
        .shadow(color: Color.white.opacity(0.3), radius: 5, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
    }
      .opacity(animate ? 1 : 0)
  }
}

struct SpinnerBindedView_Previews: PreviewProvider {
  static var previews: some View {
    SpinnerView()
  }
}
