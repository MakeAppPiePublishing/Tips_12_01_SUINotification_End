//
//  ContentView.swift
//  LocalNotification
//
//  Created by Steven Lipton on 8/14/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 12 (Q4 2020) video 01
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to implement local notifications in SwiftUI
//  For more code, go to http://bit.ly/AppPieGithub


import SwiftUI

struct ContentView: View {
    @State private var didSend:Bool = false
    var body: some View {
        VStack {
            Text("Hello, Pizza Notification!")
                .padding()
            OrderButton(action: {didSend = true}, title: "Send Notification")
            if didSend{
                VStack{
                    Text("Notification Sent")
                    Text("Hit Command-L to lock your phone")
                }.onTapGesture{didSend = false}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
