//
//  ContentView.swift
//  Spinner
//
//  Created by Pablo on 8/11/20.
//  Copyright © 2020 PaperJam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var showSpinner = false
  
  var body: some View {
    ZStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          HStack {
            Text("List")
              .font(.system(size: 30, weight: .bold))
            
            Spacer()
            
            Button(action: { self.showSpinner.toggle() }) {
              Image(systemName: "arrow.2.circlepath")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.black)
                .frame(width: 44, height: 44)
            }
          }
          
          CellView()
          CellView()
          CellView()
        }
        .padding()
      }
      
      if showSpinner {
        SpinnerView()
          .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
              withAnimation(.easeIn) {
                self.showSpinner.toggle()
              }
            }
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct CellView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 8) {
        Text("Lorem ipsum")
          .font(.title)
          .bold()
        Text("Accumsan velit orci fermentum, etiam nonummy orci pellentesque sed maecenas consectetuer, hymenaeos cras ac.")
          .font(.subheadline)
          .foregroundColor(.secondary)
        
        LinearGradient(
          gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]),
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        )
        .cornerRadius(20)
      }
      .padding()
    }
      
    .frame(height: 250)
    .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.2))
    .cornerRadius(20)
  }
}
