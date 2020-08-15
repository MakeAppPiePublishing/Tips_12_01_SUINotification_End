//
//  SwiftUIView.swift
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

struct ModalContentView: View {
    @Binding var needPermission:Bool
    var body: some View {
        VStack {
            Image(systemName:"exclamationmark.triangle.fill").font(.largeTitle).foregroundColor(.red).padding()
            Text("Notifications").font(.headline).padding()
            Text("Need permissions for notifications. Please go to settings to change" )
            Button(action:{needPermission = false}){Text("Okay").padding()}
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ModalContentView(needPermission:.constant(true))
    }
}
