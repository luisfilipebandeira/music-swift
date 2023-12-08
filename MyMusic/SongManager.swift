//
//  SongManager.swift
//  MyMusic
//
//  Created by Luis Bandeira on 08/12/23.
//

import SwiftUI

class SongManager: ObservableObject {
    @Published private(set) var song: SongsModel = SongsModel(artitst: "", audio_url: "", cover: "", title: "")
    
    func playSong(song: SongsModel) {
        self.song = song
    }
}
