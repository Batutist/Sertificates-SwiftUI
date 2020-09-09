//
//  ContentView.swift
//  SwiftUIDesignCode
//
//  Created by Sergey Kovalev on 9/8/20.
//

import SwiftUI

struct ContentView: View {
    @State var isShow = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: isShow ? 20 : 0)
                .animation(.default)
                
            
            BackCardView()
                .background(isShow ? Color.themeCard3Color : Color.themeCard4Color)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: isShow ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(isShow ? 0 : 10))
                .rotation3DEffect(
                    .degrees(10),
                    axis: (x: 1, y: 0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.5))
            
            BackCardView()
                .background(isShow ? Color.themeCard4Color : Color.themeCard3Color)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: isShow ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(isShow ? 0 : 5))
                .rotation3DEffect(
                    .degrees(5),
                    axis: (x: 1, y: 0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeOut(duration: 0.3))
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(
                    .spring(
                            response: 0.3,
                            dampingFraction: 0.6
                    )
                )
                .onTapGesture{
                    isShow.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewState = value.translation
                            isShow = true
                        }
                        .onEnded { value in
                            viewState = .zero
                            isShow = false
                        }
                )

            BottomCardView()
                .blur(radius: isShow ? 20 : 0)
                .animation(.default)
            
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(.themeAccentColor)
                }
                
                Spacer()
                
                Images.logo1Image
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Images.card1Image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            Images.Background1Image
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}



struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 500)
    }
}
