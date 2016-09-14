//
//  EventsModel.swift
//  AboutTime
//
//  Created by Mathias Vang Rasmussen on 14/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//


import Foundation
import GameKit

// MARK: Protocols

protocol EventType {
    var eventDescription: String { get set }
    var eventYear: Int { get set }
    var eventLink: String { get set }
}

// MARK: Objects

var pointsForRound: Int = 0
var randomNumber: Int = 0
var indexOfSelectedQuestion: [Int] = []
var arrayOfRandomEvents: [EventType] = []
var numberOfRounds: Int = 6
var numberOfEvents: Int = 4
var totalEventsforRound = numberOfRounds * numberOfEvents

struct Event: EventType {
    var eventDescription: String
    var eventYear: Int
    var eventLink: String
}

// MARK: Questions

let event1 = Event(eventDescription: "World War II began", eventYear: 1939, eventLink: "https://en.wikipedia.org/wiki/World_War_II")
let event2 = Event(eventDescription: "World War II ended", eventYear: 1945, eventLink: "https://en.wikipedia.org/wiki/World_War_II")
let event3 = Event(eventDescription: "World War I began", eventYear: 1914, eventLink: "https://en.wikipedia.org/wiki/World_War_I")
let event4 = Event(eventDescription: "World War I ended", eventYear: 1918, eventLink: "https://en.wikipedia.org/wiki/World_War_I")
let event5 = Event(eventDescription: "The Cold War began", eventYear: 1947, eventLink: "https://en.wikipedia.org/wiki/Cold_War")
let event6 = Event(eventDescription: "The Cold War ended", eventYear: 1991, eventLink: "https://en.wikipedia.org/wiki/Cold_War")
let event7 = Event(eventDescription: "The French Revolution ended", eventYear: 1799, eventLink: "https://en.wikipedia.org/wiki/French_Revolution")
let event8 = Event(eventDescription: "The Protestant Reformation began", eventYear: 1517, eventLink: "https://en.wikipedia.org/wiki/Protestant_Reformation")
let event9 = Event(eventDescription: "America was Colonized", eventYear: 1492, eventLink: "https://en.wikipedia.org/wiki/European_colonization_of_the_Americas")
let event10 = Event(eventDescription: "The Vietnam War began", eventYear: 1955, eventLink: "https://en.wikipedia.org/wiki/Vietnam_War")
let event11 = Event(eventDescription: "The American Revolution began", eventYear: 1775, eventLink: "https://en.wikipedia.org/wiki/American_Revolution")
let event12 = Event(eventDescription: "The first man walked the moon", eventYear: 1969, eventLink: "https://en.wikipedia.org/wiki/Apollo_11")
let event13 = Event(eventDescription: "The American Declaration of Independence was signed", eventYear: 1776, eventLink: "https://en.wikipedia.org/wiki/Independence_Day_(United_States)")
let event14 = Event(eventDescription: "The Cuban missile crisis", eventYear: 1962, eventLink: "https://en.wikipedia.org/wiki/Cuban_Missile_Crisis")
let event15 = Event(eventDescription: "The American Civil War started", eventYear: 1861, eventLink: "https://en.wikipedia.org/wiki/American_Civil_War")
let event16 = Event(eventDescription: "The American Civil War ended", eventYear: 1865, eventLink: "https://en.wikipedia.org/wiki/American_Civil_War")
let event17 = Event(eventDescription: "The ending of the Boxer Rebellion", eventYear: 1901, eventLink: "https://en.wikipedia.org/wiki/Boxer_Rebellion")
let event18 = Event(eventDescription: "The Zimmerman Telegram was sent", eventYear: 1917, eventLink: "https://en.wikipedia.org/wiki/Zimmermann_Telegram")
let event19 = Event(eventDescription: "The World Trade Centre Attacks", eventYear: 2001, eventLink: "https://en.wikipedia.org/wiki/September_11_attacks")
let event20 = Event(eventDescription: "The assassination of Archduke Franz Ferdinand of Austria", eventYear: 1914, eventLink: "https://en.wikipedia.org/wiki/Assassination_of_Archduke_Franz_Ferdinand_of_Austria")
let event21 = Event(eventDescription: "The Boston Tea Party", eventYear: 1773, eventLink: "https://en.wikipedia.org/wiki/Boston_Tea_Party")
let event22 = Event(eventDescription: "The fall of the Berlin Wall", eventYear: 1989, eventLink: "https://en.wikipedia.org/wiki/Berlin_Wall")
let event23 = Event(eventDescription: "The Great Depression", eventYear: 1929, eventLink: "https://en.wikipedia.org/wiki/Great_Depression")
let event24 = Event(eventDescription: "The Attack on Pearl Harbor", eventYear: 1941, eventLink: "https://en.wikipedia.org/wiki/Attack_on_Pearl_Harbor")
let event25 = Event(eventDescription: "The Treaty of Versailles was signed", eventYear: 1919, eventLink: "https://en.wikipedia.org/wiki/Treaty_of_Versailles")
let event26 = Event(eventDescription: "The October Revolution", eventYear: 1917, eventLink: "https://en.wikipedia.org/wiki/October_Revolution")
let event27 = Event(eventDescription: "John F. Kennedy is assassinated", eventYear: 1963, eventLink: "https://en.wikipedia.org/wiki/John_F._Kennedy")
let event28 = Event(eventDescription: "Titanic sank", eventYear: 1912, eventLink: "https://en.wikipedia.org/wiki/RMS_Titanic")
let event29 = Event(eventDescription: "Galileo explore the moons of Jupiter", eventYear: 1610, eventLink: "https://en.wikipedia.org/wiki/Galileo_Galilei")
let event30 = Event(eventDescription: "The Acts of Union", eventYear: 1707, eventLink: "https://en.wikipedia.org/wiki/Acts_of_Union_1707")
let event31 = Event(eventDescription: "New Zealand becomes first country in the world to grant women the vote", eventYear: 1893, eventLink: "https://en.wikipedia.org/wiki/Women%27s_suffrage_in_New_Zealand")
let event32 = Event(eventDescription: "Rwandan Genocide", eventYear: 1994, eventLink: "https://en.wikipedia.org/wiki/Rwandan_genocide")
let event33 = Event(eventDescription: "Assassination of Abraham Lincoln", eventYear: 1865, eventLink: "https://en.wikipedia.org/wiki/Assassination_of_Abraham_Lincoln")
let event34 = Event(eventDescription: "The Treaty of Rome is signed", eventYear: 1957, eventLink: "https://en.wikipedia.org/wiki/Treaty_of_Rome")
let event35 = Event(eventDescription: "The Treaty of Maastricht is signed", eventYear: 1992, eventLink: "https://en.wikipedia.org/wiki/Maastricht_Treaty")
let event36 = Event(eventDescription: "Hitler became the Chancellor of Germany", eventYear: 1933, eventLink: "https://en.wikipedia.org/wiki/Adolf_Hitler")
let event37 = Event(eventDescription: "Beginning of the Spanish Civil War", eventYear: 1936, eventLink: "Link1")
let event38 = Event(eventDescription: "Death of Napolean", eventYear: 1821, eventLink: "https://en.wikipedia.org/wiki/Napoleon")
let event39 = Event(eventDescription: "Slavery abolished in USA", eventYear: 1863, eventLink: "https://en.wikipedia.org/wiki/Slavery_in_the_United_States")
let event40 = Event(eventDescription: "Formation of the League of Nations", eventYear: 1920, eventLink: "https://en.wikipedia.org/wiki/League_of_Nations")

let eventArray = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17, event18, event19, event20, event21, event22, event23, event24, event25, event26, event27, event28, event29, event30, event31, event32, event33, event34, event35, event36, event37, event38, event39, event40]



// MARK: Round Class

class Round {
    var roundNumber: Int = 0
    
    func setupRound() {
        
        while arrayOfRandomEvents.count <= totalEventsforRound {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: eventArray.count)
            if indexOfSelectedQuestion.contains(randomNumber) {
            } else {
                arrayOfRandomEvents.append(eventArray[randomNumber])
                indexOfSelectedQuestion.append(randomNumber)
            }
        }
    }
    
    func resetRound() {
        pointsForRound = 0
        roundNumber = 0
        arrayOfRandomEvents.removeAll()
        indexOfSelectedQuestion.removeAll()
    }
    
}
