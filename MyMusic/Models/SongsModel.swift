//
//  SongsModel.swift
//  MyMusic
//
//  Created by Luis Bandeira on 08/12/23.
//

import SwiftUI

struct SongsModel: Identifiable {
    var id: UUID = .init()
    var artitst: String
    var audio_url: String
    var cover: String
    var title: String
    var isFavourite: Bool = false
}

var sampleSongModel: [SongsModel] = [
    .init(artitst: "Gusttavo Lima", audio_url: "", cover: "https://uploads.metropoles.com/wp-content/uploads/2023/09/13173024/Gusttavo-Lima-Credito-Augusto-Albuquerque.jpg", title: "Embaixador"),
    .init(artitst: "Marilia Mendonça", audio_url: "", cover: "https://s2-oglobo.glbimg.com/juJtKV-YiupzCq6CbjOx3LZm77k=/0x0:1080x720/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2022/S/b/vrKs0JRvWsyzb3DvYhxg/96187324.jpg", title: "Leão"),
    .init(artitst: "Ed Sheeran", audio_url: "", cover: "https://i.scdn.co/image/ab67616d0000b273757395e780272e9e7929ac7e", title: "Sing"),
    .init(artitst: "Coldplay", audio_url: "", cover: "https://classic.exame.com/wp-content/uploads/2023/03/Coldplay_divulgacao.jpg?quality=70&strip=info&w=800", title: "Viva la vida"),
    .init(artitst: "Zeze di camargo e Luciano", audio_url: "", cover: "https://upload.wikimedia.org/wikipedia/pt/1/1b/Zez%C3%A9_Di_Camargo_%26_Luciano_%28%C3%A1lbum_de_1991%29.jpg", title: "Sonho de amor"),
    .init(artitst: "Henrique e Juliano", audio_url: "", cover: "https://i.ytimg.com/vi/X8jD3F9PI7Q/maxresdefault.jpg", title: "Na hora da raiva"),
    .init(artitst: "Gusttavo Lima", audio_url: "", cover: "https://uploads.metropoles.com/wp-content/uploads/2023/09/13173024/Gusttavo-Lima-Credito-Augusto-Albuquerque.jpg", title: "Bom Perdedor"),
    .init(artitst: "Marilia Mendonça", audio_url: "", cover: "https://s2-oglobo.glbimg.com/juJtKV-YiupzCq6CbjOx3LZm77k=/0x0:1080x720/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2022/S/b/vrKs0JRvWsyzb3DvYhxg/96187324.jpg", title: "Eu sei de cor"),
    .init(artitst: "Ed Sheeran", audio_url: "", cover: "https://i.scdn.co/image/ab67616d0000b273757395e780272e9e7929ac7e", title: "Galway Girl"),
    .init(artitst: "Coldplay", audio_url: "", cover: "https://classic.exame.com/wp-content/uploads/2023/03/Coldplay_divulgacao.jpg?quality=70&strip=info&w=800", title: "Yellow"),
    .init(artitst: "Zeze di camargo e Luciano", audio_url: "", cover: "https://upload.wikimedia.org/wikipedia/pt/1/1b/Zez%C3%A9_Di_Camargo_%26_Luciano_%28%C3%A1lbum_de_1991%29.jpg", title: "E  o amor"),
    .init(artitst: "Henrique e Juliano", audio_url: "", cover: "https://i.ytimg.com/vi/X8jD3F9PI7Q/maxresdefault.jpg", title: "Te esqueci sem querer")]
