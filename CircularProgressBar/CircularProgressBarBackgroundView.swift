//
//  CircularProgressBarBackgroundView.swift
//  CircularProgressBar
//
//  Created by Alex Zarr on 2022-04-15.
//

import SwiftUI

struct CircularProgressBarBackgroundView: View {
    let total: Int
    @State var lineWidth: CGFloat = 16
    
    var shortDashSize: CGFloat { 1 }
    func longDashSize(circleWidth: CGFloat) -> CGFloat {
        .pi * circleWidth / CGFloat(total) - shortDashSize
    }
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(Color(white: 230/255),
                        style: StrokeStyle(
                            lineWidth: lineWidth / 1.6,
                            lineCap: .butt,
                            lineJoin: .miter,
                            miterLimit: 0,
                            dash: [
                                longDashSize(circleWidth: geometry.size.width),
                                shortDashSize
                            ],
                            dashPhase: 0))
                .rotationEffect(.degrees(-90))
        }
        .padding(lineWidth/2)
    }
}

struct CircularProgressBarBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarBackgroundView(total: 6)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
