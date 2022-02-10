//
//  LoadingView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/9/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
            Spacer()
        }
        .background(.ultraThinMaterial)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            LoadingView()
        }
    }
}
