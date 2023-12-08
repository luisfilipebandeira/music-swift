//
//  MusicView.swift
//  MyMusic
//
//  Created by Luis Bandeira on 06/12/23.
//

import SwiftUI

struct MusicView: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    
    @State private var animateContent: Bool = false
    @State private var offsetY: CGFloat = 0
    
    @EnvironmentObject var songManager: SongManager
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let safeArea = geometry.safeAreaInsets
            
            ZStack(alignment: .top) {
                RoundedRectangle(
                    cornerRadius: animateContent ? deviceCornerRadius : 0,
                    style: .continuous
                )
                .fill(.black)
                .overlay {
                    Rectangle()
                        .fill(.black)
                        .opacity(animateContent ? 1 : 0)
                }
                .overlay(alignment: .top) {
                    MusicInfo(expandSheet: $expandSheet, animation: animation)
                        .allowsHitTesting(false)
                        .opacity(animateContent ? 0 : 1)
                }
                .matchedGeometryEffect(id: "BACKGROUNDVIEW", in: animation)
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.3), Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 300)
                
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "chevron.down")
                            .imageScale(.large)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    expandSheet = false
                                    animateContent = false
                                }
                            }
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("Playlist from album")
                                .opacity(0.5)
                                .font(.caption)
                            
                            Text("Soft Pop Hits")
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(-90))
                    }
                    .padding(.horizontal)
                    .padding(.top, 80)
                    
                    GeometryReader {
                        let size = $0.size
                            AsyncImage(url: URL(string: songManager.song.cover)) { img in
                                img.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: size.width, height: size.height)
                            .clipShape(
                                RoundedRectangle(cornerRadius: animateContent ? 30 : 60,
                                style: .continuous
                            )
                        )
                    }
                    .matchedGeometryEffect(id: "SONGCOVER", in: animation)
                    .frame(height: size.width)
                    .padding(.vertical, size.height < 700 ? 30 : 20)
                    
                    PlayerView(size)
                    
                }
                .padding(.top, safeArea.top + (safeArea.bottom == 0 ? 10 : 0))
                .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.36)) {
                        expandSheet.toggle()
                        animateContent.toggle()
                    }
                }
            }
            .contentShape(Rectangle())
            .offset(y: offsetY)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        let translationY = value.translation.height
                        offsetY = (translationY > 0 ? translationY : 0)
                    }).onEnded({ value in
                        withAnimation(.easeInOut(duration: 0.3)) {
                            if offsetY > size.height * 0.4 {
                                expandSheet = false
                                animateContent = false
                            } else {
                                offsetY = .zero
                            }
                        }
                    })
            ).ignoresSafeArea(.container, edges: .all)
            
        }
        .edgesIgnoringSafeArea(.top)
        .background(.black)
        .onAppear() {
            withAnimation(.easeInOut(duration: 0.35)) {
                animateContent = true
            }
        }
    }
    
    @State var value = 11.0
    
    @ViewBuilder
    func PlayerView(_ mainSize: CGSize) -> some View {
        GeometryReader {
            let size = $0.size
            let spacing = size.height * 0.04
            
            VStack(spacing: spacing) {
                VStack(alignment: .center, spacing: 15, content: {
                    VStack(alignment: .center, spacing: 10, content: {
                        VStack {
                            Text("\(songManager.song.title)")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        Text(songManager.song.title)
                            .font(.title3)
                            .foregroundStyle(.gray)
                    })
                    .frame(maxWidth: .infinity)
                    
                    Slider(value: $value, in: 0...100)
                    
                    HStack {
                        Text("0:50")
                            .font(.caption)
                        
                        Spacer()
                        
                        Text("3:55")
                            .font(.caption)
                    }
                    
                    HStack(alignment: .center, spacing: 30) {
                        Image(systemName: "shuffle")
                            .imageScale(.medium)
                        
                        Image(systemName: "backward.end.fill")
                            .imageScale(.medium)
                        
                        Image(systemName: "play.fill")
                            .imageScale(.large)
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        
                        Image(systemName: "forward.end.fill")
                            .imageScale(.medium)
                        
                        Image(systemName: "repeat")
                            .imageScale(.medium)
                    }
                })
            }
        }
    }
}



#Preview {
    ContentView()
}

extension View {
    var deviceCornerRadius: CGFloat {
        guard let screen = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows.first?.screen else {
                return 0
        }
        return screen.value(forKey: "_displayCornerRadius") as? CGFloat ?? 0
    }
}
