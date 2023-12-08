//
//  Home.swift
//  MyMusic
//
//  Created by Luis Bandeira on 06/12/23.
//

import SwiftUI

struct Home: View {
    @State private var expandSheet = false
    @Namespace private var animation
    
    @EnvironmentObject var songManager: SongManager
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                header
                
                TagsView()
                
                QuickPlay()
                
                LargeCardsView()
            }
            .padding(.bottom, 100)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // Header
    var header: some View {
        GeometryReader { size in
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Text("Good morning moods")
                        .font(.title2)
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .imageScale(.large)
                    
                    Image(systemName: "person")
                        .imageScale(.large)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, getSafeAreaTop())
        .background(LinearGradient(colors: [Color.red.opacity(0.8), .clear], startPoint: .top, endPoint: .bottom))
        .frame(width: .infinity, height: getSafeAreaTop() * 2)
    }
    
    // Tags View
    @ViewBuilder func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(sampleTagList, id: \.id) { item in
                    Text(item.tag)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.white.opacity(0.15)))
                }
            }
            .padding()
        }
    }
    
    // Quick Play
    @ViewBuilder func QuickPlay() -> some View {
        VStack {
            HStack {
                Text("Quick Play")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.fixed(60)),
                    GridItem(.fixed(60)),
                    GridItem(.fixed(60)),
                    GridItem(.fixed(60))
                ], content: {
                    ForEach(sampleSongModel, id: \.id) { item in
                        HStack(spacing: 20) {
                            AsyncImage(url: URL(string: item.cover)) { img in
                                img.resizable()
                                    .scaledToFill()
                                    .clipShape(.rect(cornerRadius: 5))
                            } placeholder: {
                                ProgressView()
                                    .background(.white.opacity(0.1))
                                    .clipShape(.rect(cornerRadius: 5))
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(.rect(cornerRadius: 5))
                            
                            VStack(alignment: .leading) {
                                Text("\(item.title)")
                                    .font(.headline)
                                
                                Text("\(item.artitst)")
                                    .font(.caption)
                            }
                            
                            Spacer()
                        }
                        .onTapGesture(perform: {
                            songManager.playSong(song: item)
                        })
                    }
                })
                .padding(.horizontal)
            }
        }
    }
    
    // Large cards View
    @ViewBuilder func LargeCardsView() -> some View {
        VStack {
            HStack {
                Text("New Releases")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(sampleSongModel, id: \.id) { item in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: item.cover)) { img in
                                img.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 160, height: 160)
                            .clipShape(.rect(cornerRadius: 20))
                            
                            Text("\(item.title)")
                                .font(.headline)
                            
                            Text("\(item.artitst)")
                                .font(.caption)
                        }
                        .onTapGesture(perform: {
                            songManager.playSong(song: item)
                        })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // func to get safe area top
    func getSafeAreaTop() -> CGFloat {
        guard let keyWindow = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .filter({ $0.isKeyWindow }).first else {
            // Handle the case when the key window is not available
            return 0
        }
        
        if #available(iOS 11.0, *) {
            if let safeAreaTop = keyWindow.safeAreaInsets.top {
                return safeAreaTop
            } else {
                // Handle the case when safeAreaInsets.top is not available
                return 0
            }
        } else {
            // For versions prior to iOS 11, safe area insets are not available
            return 0
        }
    }

}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
