//
//  Events.swift
//  Bout Time
//
//  Created by Jacob Virgin on 7/22/16.
//  Copyright © 2016 Jacob Virgin. All rights reserved.
//

import Foundation

struct Event {
    var title: String = ""
    var year: Int = 0
    var url: String = ""
    var selected: Bool = false
    
    init(title: String, year: Int, url: String) {
        self.title = title
        self.year = year
        self.url = url
        self.selected = false
        
    }
    
}

var events: [Event] = []

func initializeEvents() {
    let event1: Event = Event(title: "Beyonce releases the album Dangerously in Love", year: 2003, url: "https://en.wikipedia.org/wiki/Dangerously_in_Love")
    events.append(event1)
    let event2: Event = Event(title: "Beyonce releases the album B'day", year: 2006, url: "https://en.wikipedia.org/wiki/B%27Day_(Beyonc%C3%A9_album)")
    events.append(event2)
    let event3: Event = Event(title: "Beyonce releases the album B'day Deluxe Edition", year: 2007, url: "https://en.wikipedia.org/wiki/B%27Day_(Beyonc%C3%A9_album)")
    events.append(event3)
    let event4: Event = Event(title: "Beyonce releases the album I AM...SASHA FIERCE", year: 2008, url: "https://en.wikipedia.org/wiki/I_Am..._Sasha_Fierce")
    events.append(event4)
    let event5: Event = Event(title: "Beyonce releases the album 4", year: 2013, url: "https://en.wikipedia.org/wiki/4_(Beyonc%C3%A9_album)")
    events.append(event5)
    let event6: Event = Event(title: "Beyonce releases the album BEYONCE", year: 2014, url: "https://en.wikipedia.org/wiki/Beyonc%C3%A9_(album)")
    events.append(event6)
    let event7: Event = Event(title: "Beyonce releases the album Lemonade", year: 2016, url: "https://en.wikipedia.org/wiki/Lemonade_(Beyonc%C3%A9_album)")
    events.append(event7)
    let event8: Event = Event(title: "Lady Gaga releases the album The Fame", year: 2008, url: "https://en.wikipedia.org/wiki/The_Fame")
    events.append(event8)
    let event9: Event = Event(title: "Lady Gaga releases the album The Fame Monster", year: 2009, url: "https://en.wikipedia.org/wiki/The_Fame_Monster")
    events.append(event9)
    let event10: Event = Event(title: "Lady Gaga releases the album Born This Way", year: 2011, url: "https://en.wikipedia.org/wiki/Born_This_Way_(album)")
    events.append(event10)
    let event11: Event = Event(title: "Lady Gaga releases the album ARTPOP", year: 2013, url: "https://en.wikipedia.org/wiki/Artpop")
    events.append(event11)
    let event12: Event = Event(title: "Lady Gaga releases the album Cheek to Cheek", year: 2014, url: "https://en.wikipedia.org/wiki/Cheek_to_Cheek_(album)")
    events.append(event12)
    let event13: Event = Event(title: "Ariana Grande releases the album Yours Truly", year: 2013, url: "https://en.wikipedia.org/wiki/Yours_Truly_(Ariana_Grande_album)")
    events.append(event13)
    let event14: Event = Event(title: "Ariana Grande releases the album My Everything", year: 2014, url: "https://en.wikipedia.org/wiki/My_Everything_(Ariana_Grande_album)")
    events.append(event14)
    let event15: Event = Event(title: "Ariana Grande releases the album Dangerous Woman", year: 2016, url: "https://en.wikipedia.org/wiki/Dangerous_Woman_(album)")
    events.append(event15)
    let event16: Event = Event(title: "Adele releases the album 19", year: 2008, url: "https://en.wikipedia.org/wiki/19_(Adele_album)")
    events.append(event16)
    let event17: Event = Event(title: "Adele releases the album 21", year: 2011, url: "https://en.wikipedia.org/wiki/21_(Adele_album)")
    events.append(event17)
    let event18: Event = Event(title: "Adele releases the album 25", year: 2016, url: "https://en.wikipedia.org/wiki/25_(Adele_album)")
    events.append(event18)
    let event19: Event = Event(title: "Nicki Minaj releases the album Pink Friday", year: 2010, url: "https://en.wikipedia.org/wiki/Pink_Friday")
    events.append(event19)
    let event20: Event = Event(title: "Nicki Minaj releases the album The Pinkprint", year: 2014, url: "https://en.wikipedia.org/wiki/The_Pinkprint")
    events.append(event20)
    let event21: Event = Event(title: "Fergie releases the album The Duchess", year: 2006, url: "https://en.wikipedia.org/wiki/The_Dutchess")
    events.append(event21)
    let event22: Event = Event(title: "Tori Kelly releases the album Unbreakable Smile", year: 2016, url: "https://en.wikipedia.org/wiki/Unbreakable_Smile")
    events.append(event22)
    let event23: Event = Event(title: "Meghan Trainor releases the album Title", year: 2015, url: "https://en.wikipedia.org/wiki/Title_(Meghan_Trainor_album)")
    events.append(event23)
    let event24: Event = Event(title: "Meghan Trainor releases the album Thank You", year: 2016, url: "https://en.wikipedia.org/wiki/Thank_You_(Meghan_Trainor_album)")
    events.append(event24)
    let event25: Event = Event(title: "Selena Gomez releases the album Revival", year: 2016, url: "https://en.wikipedia.org/wiki/Revival_(Selena_Gomez_album)")
    events.append(event25)
    
    
}
