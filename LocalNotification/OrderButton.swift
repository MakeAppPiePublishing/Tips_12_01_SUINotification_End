//
//  OrderButton.swift
//  HuliPizzaMenuWatch Extension
//
//  Created by Steven Lipton on 7/31/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 12 (Q4 2020) video 01
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to implement local notifications in SwiftUI
//  For more code, go to http://bit.ly/AppPieGithub


import SwiftUI
import UserNotifications

struct OrderButton: View {
    var action: () -> Void
    var title:String = "Order"
    @State private var needPermission:Bool = false
    var body: some View {
        Button(action: {
            sendNotification(delay:5.0)
            action()
        }, label: {
            Text(title)
                .font(.headline )
        })
        .sheet(isPresented:$needPermission){
            ModalContentView(needPermission: $needPermission)
        }
    }
    
    func sendNotification(delay:TimeInterval){
        let UNcenter = UNUserNotificationCenter.current()
        needPermission = false
        UNcenter.requestAuthorization(options: [.alert,.sound]) { (granted, nil) in
            if granted {
                UNcenter.getNotificationSettings { (settings) in
                    let auth = settings.authorizationStatus
                    if auth == .authorized || auth == .provisional{
                        let content = UNMutableNotificationContent()
                        content.body = "Pizza is on the way!"
                        content.title = "Huli Pizza"
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNcenter.add(request, withCompletionHandler: nil)
                    }//authorization
                    else{needPermission = true}
                }//getnotificationSettings
            }//granted
            else{needPermission = true}
        }//requestAuthorization
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(action: {})
    }
}


