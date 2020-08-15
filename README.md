## RandomQuote
 This app display a random quote to the user. 

##  Features: 
- Display a random quote to the user containing : Quote - Author
- Allow the user to fetch a new random quote.
- Allow the user to mark a quote as favorite.
- Allow the user to view his favorites quotes.
- Offline support. If the user is offline, they should be able to see the last loaded quote 

# Implementation
 - the main screen is <strong> QuoteViewController.swift</strong> witch displays a random quote ,
 also it cointains two buttons , one for fetch new quote and the other to save 
 the current qoute to favorate .

- <strong> QuoteTableViewController.swift</strong>  will view favorate qoutes on tableview and the
user can delete specific qoute by slide left the qoute cell then press delete button.
 
# How to run
`> cd RandomQuote`
`> open RandomQuote.xcodeproj`

Run!

# How to build
Build: ⌘ + B.
Run: ⌘ + R.

# Requirements
 - Xcode 10
 - Swift 4.2


