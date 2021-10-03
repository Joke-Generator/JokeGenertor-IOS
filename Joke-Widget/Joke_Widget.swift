//
//  Joke_Widget.swift
//  Joke-Widget
//
//  Created by Mely on 24.09.2021.
//

import WidgetKit
import SwiftUI


struct JokeEntry : TimelineEntry{
    var date = Date()
    let joke :GeneralJoke
    
}

struct Provider : TimelineProvider {
    
    var jokeData : Data = Data()
    
    
    func placeholder(in context: Context) -> JokeEntry {
        return JokeEntry(date: Date(), joke: GeneralJoke(joke: "Nope", category: "Wrong"))
    }
    
    func getSnapshot(in context: Context, completion: @escaping (JokeEntry) -> Void) {
        let tempJoke = JokeGenerateWorker().fetch()
        let entry = JokeEntry(joke: tempJoke)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<JokeEntry>) -> Void) {
        let tempJoke = JokeGenerateWorker().fetch()
        let entry = JokeEntry(joke: tempJoke)
        let timeLine = Timeline(entries: [entry], policy: .atEnd)
        completion(timeLine)
    }
        
}

struct WidgetEntryView: View{
    let entry = Provider.Entry(joke: JokeGenerateWorker().fetch())
    
    var body: some View{
        JokeView(generalJoke: entry.joke)
        
    }
}

struct JokeView : View{
    let generalJoke : GeneralJoke
    
    var body: some View{
        Text(generalJoke.joke)
            .font(.title2)
            .padding()
    }
}

@main
struct Joke_Widget : Widget {
    private let kind = "JokeGeneratorWidget"
    
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind,
                            provider: Provider()) { entry in
                            WidgetEntryView()
        }
                            .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}