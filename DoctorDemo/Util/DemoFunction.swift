//
//  DemoFunction.swift
//  DoctorDemo
//
//  Created by Sanju on 30/09/23.
//

import Foundation


struct DemoFunction {
    static func loadPost() -> Data? {
        if let url = Bundle.main.url(forResource: "demo_post_two", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
