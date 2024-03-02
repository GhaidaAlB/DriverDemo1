//
//  CalendarWidget.swift
//  DriverDemo1
//
//  Created by Ghaida AlBaltan on 02/03/2024.
//

import SwiftUI
import EventKit
import EventKitUI

struct CalendarWidget: View {
    let today = Date()
    @State private var events: [EKEvent] = []
    //@State private var isPresentingCalendarChooser = false
    
    
    var body: some View {
        VStack{
            Text("Today's events:")
               .font(.title)
               .padding()
            
           /* Button("Choose Calendar"){
                isPresentingCalendarChooser = true
            }*/
            
            //Display today's events
            VStack(alignment: .leading, spacing: 8){
                ForEach(events, id: \.eventIdentifier) { event in Text(event.title)}
            }
            .padding()
            
            Spacer()
        }
        
        .onAppear {
            fetchEvents()
            
        /*.sheet(isPresented: $isPresentingCalendarChooser){
                    CalendarChooserView(isPresented: $isPresentingCalendarChooser)
                }*/
        }
    }
    
    //Date formatting
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    
    //Event fetching
    private func fetchEvents(){
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
            
        let startDate = Calendar.current.startOfDay(for: today)
        let endDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate)!
            
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: calendars)
            
        events = eventStore.events(matching: predicate)
        }
        
        
    //Calendar Chooser View
    /*struct CalendarChooserView: UIViewControllerRepresentable {
        
        @Binding var isPresented: Bool
        
        func makeUIViewController(context: Context) -> some UINavigationController {
            let calendarChooser = EKCalendarChooser(selectionStyle: .single, displayStyle: .allCalendars, entityType: .event, eventStore: EKEventStore)
            calendarChooser.showsDoneButton = true
            calendarChooser.showsCancelButton = true
            calendarChooser.delegate = context.coordinator
            let navigationController = UINavigationController(rootViewController: calendarChooser)
            return navigationController
        }
        
        func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
            
        }
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        
        class Coordinator: NSObject, EKCalendarChooserDelegate {
            let parent: CalendarChooserView
            
            init(parent: CalendarChooserView) {
                self.parent = parent
            }
            
            func calendarChooserDidFinish(_ calendarChooser: EKCalendarChooser) {
                parent.isPresented = false
            }
            
            func calendarChooserDidCancel(_ calendarChooser: EKCalendarChooser) {
                parent.isPresented = false
            }*/
        }
        
    //}
    
    struct CalendarWidget_Previews: PreviewProvider {
        static var previews: some View {
            CalendarWidget()
        }
    }
//}
