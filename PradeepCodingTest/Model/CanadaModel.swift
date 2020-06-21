//
//  CanadaModel.swift
//  PradeepCodingTest
//
//  Created by Pradeep on 21/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation
// MARK: - Canada
struct CanadaModel: Decodable {
    let title: String
    let rows: [CanadaRowModel]
}

// MARK: - Row
struct CanadaRowModel: Decodable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
