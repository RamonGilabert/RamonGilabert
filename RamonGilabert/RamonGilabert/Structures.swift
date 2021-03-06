import UIKit

struct Text {
    struct Titles {
        static let StoryTitle = "Everyone has a story"
        static let StorySubtitle = "Here's mine, called dream..."
        static let StorySecondaryTitle = "A dream..."
    }
}

struct Story {
    static let One = "I believe everyone has a story to tell, something that would make someone smile, a story that would make other people feel…"

    static let Two = "image-passion-story"

    static let Three = "That's my passion, and those are my paths..."

    static let Four = "It all started..."

    static let Five = "My story in programming starts when I was a kid, I used to enter to my dad’s computer to look for some websites. I was amazed by the design on it, how you could see content from everywhere in the world, there, I knew that at some point, I would do a website."

    static let Six = "The same happened when my father bought his first iPhone, the keyboard sensing his big fingers was something awesome, but not as stunning as the animation in the camera, I loved every aspect of it, and I also knew, that one day I would know how to do an app."

    static let Seven = "image-chicago-story"

    static let Eight = "First time in the US, doing iOS, dream..."

    static let Nine = "Chicago"

    static let Ten = "After a summer working every day of the week to have some money in the bank, I bought my first MacBook Pro, I was 17 years old back then. Then it all started, I launched my most personal and big project, my portfolio, I was hungry to do more, I wanted to learn some languages, build some apps… I discovered Xcode, and  I spent lots of afternoons writing small apps, discovering new frameworks, until I was selected to go to an intense iOS academy in Chicago."

    static let Eleven = "web-image-story"

    static let Twelve = "My portfolio, my most personal project."

    static let Thirteen = "After two months and more than 40 small apps, I did my first big project using Multipeer and Geofencing and since then, I know this is my passion, this is what I want to be. Even though I’m in university most of the day, when I get home I try to build something new, combining it with some design and giving some pixels life…"

    static let Fourteen = "Buying a mac opened me the doors to what I wanted to become, to what I wanted to be, a designer and a coder, that was my dream and that’s my story. And I can't wait, for what's next..."

    static let Fiveteen = "wwdc-image-logo-by-apple"

    static let Sixteen = "I can't wait for what's next! (Image © Apple Inc.)"

    static let ArrayWithStory = [Story.One, Story.Two, Story.Three, Story.Four, Story.Five, Story.Six, Story.Seven, Story.Eight, Story.Nine, Story.Ten, Story.Eleven, Story.Twelve, Story.Thirteen, Story.Fourteen, Story.Fiveteen, Story.Sixteen]
}

struct Skills {
    static let One: [String: AnyObject] = ["left": 0.85 as CGFloat, "right": 0.95 as CGFloat, "leftColor": UIColor(red:0.95, green:0.65, blue:0.21, alpha:1), "rightColor": UIColor(red:0.31, green:0.57, blue:0.87, alpha:1), "leftText": "Swift", "rightText": "Objective C"]

    static let Two: [String: AnyObject] = ["left": 0.7 as CGFloat, "right": 0.85 as CGFloat, "leftColor": UIColor(red:0.51, green:0.82, blue:0.2, alpha:1), "rightColor": UIColor(red:0.43, green:0.26, blue:0.93, alpha:1), "leftText": "HTML/CSS", "rightText": "Electronics"]

    static let Three: [String: AnyObject] = ["left": 0.8 as CGFloat, "right": 0.85 as CGFloat, "leftColor": UIColor(red:0.93, green:0.38, blue:0.46, alpha:1), "rightColor": UIColor(red:0.69, green:0.96, blue:0.4, alpha:1), "leftText": "Design", "rightText": "FramerJS"]

    static let Four = "Separator"

    static let Five = "After going to Chicago and starting again my Electronic Engineering studies, I try to develop something new every day, trying new frameworks, learning new things, improving my skillset and keep growing as a worker and as a person."

    static let Six = "Separator"

    static let Seven = "skillset-bottom-image"

    static let ArrayWithSkills = [Skills.One, Skills.Two, Skills.Three, Skills.Four, Skills.Five, Skills.Six, Skills.Seven]
}

struct Projects {
    static let Linx: [String: AnyObject] = ["title": "Linx", "position": "iOS development and design", "image": "linx-app-image", "text": "Linx was the first big project I did after finishing my training in Chicago. This was a social app to connect with people around using multipeer connectivity and geofencing."]

    static let Ono: [String: AnyObject] = ["title": "ONO", "position": "iOS development and design", "image": "ono-app-image", "text": "ONO was an app to record a voice message and send it to your friends. Send friend requests, update your profile, etc. A real social network."]

    static let Framer: [String: AnyObject] = ["title": "FramerJS", "position": "CoffeeScript development", "image": "framer-js-image", "text": "I tried FramerJS first this year, a prototype by code app, I didn't know about CoffeeScript, but I started to learn it, doing awesome things like the presentation video of the app."]

    static let Web: [String: AnyObject] = ["title": "Web", "position": "Web development and design", "image": "web-image", "text": "Web was the first thing I wanted to learn since I was a kid, thank's to some tutorials and lots of passion, I released my main web, my main project, my portfolio."]

    static let Dribbble: [String: AnyObject] = ["title": "Dribbble", "position": "Design", "image": "dribbble-image", "text": "Dribbble, the place where I wanted to show my designs, inspire other people as they were doing to me, being able to enter to that community was amazing."]

    static let OpenSource: [String: AnyObject] = ["title": "Open source", "position": "iOS development", "image": "open-source-app-image", "text": "Two months ago I started to contribute to some cool open source iOS projects that could help other people. I'll open source various parts of this app, and the app itself!"]

    static let Tutorials: [String: AnyObject] = ["title": "Tutorials", "position": "Development and design", "image": "tutorials-image", "text": "As in the open source part, I like to show what I know as they have done to me, I've done a tutorial in FramerJS, and the Swift ones are coming!"]

    static let ArrayWithProjects = [Projects.Linx, Projects.Ono, Projects.Framer, Projects.Web, Projects.Dribbble, Projects.OpenSource, Projects.Tutorials] as NSArray
}

struct ContactWebs {
    static let Website = NSURL(string: "http://ramongilabert.com")
    static let Twitter = NSURL(string: "https://twitter.com/RamonGilabert")
    static let Dribbble = NSURL(string: "https://dribbble.com/RamonGilabert")
    static let Github = NSURL(string: "https://github.com/RamonGilabert")
}

class Structures: NSObject {
   
}
