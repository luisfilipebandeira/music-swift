//
//  TagsModel.swift
//  MyMusic
//
//  Created by Luis Bandeira on 08/12/23.
//

import SwiftUI

struct TagsModel: Identifiable {
    var id: UUID = .init()
    var tag: String
}

var sampleTagList: [TagsModel] = [
    TagsModel(tag: "Romance"),
    TagsModel(tag: "Feel Good"),
    TagsModel(tag: "Podcasts"),
    TagsModel(tag: "Party"),
    TagsModel(tag: "Relax"),
    TagsModel(tag: "Commute"),
    TagsModel(tag: "Workout"),
    TagsModel(tag: "Sad"),
    TagsModel(tag: "Focus")
]
