# SimpleSignupForm
Simple Signup Form to better understand my mobile development and user interface design abilities.

## Architecture

### Redux
This app uses a redux type architecture with an AppStore that holds the AppState. The AppState is broken down into sperate states on a per view basis. When an event or user action occurs an action is dispatched to the store. The store passes this action to it's reducers to handle the action. Prior to calling the reducers the middleware is consulted. Middleware returns an action publisher, usually after an asynchronous task happens. The main app reducer subscribes to these action publishers and dispatches the returned action once the MiddleWare finishes.

### Routing
The routing is handled by a Router object. Each route is represented in an enum and the router is told to route to a specific place in the app. All routing is done using UIKit and UIViewControllers.

### Views
All Views, except for the alerts, were built using SwiftUI. To integrate with UIKit these views are wrapped in UIHostingControllers.

### Design
The design was provided and followed as closely as specs in a PDF can be followed. Items like Font, sizing, and colors were done at a best guess. All of these elementes are contained in the StyleSheet and could be changed quickly. 

### Changes to Design
In landscape one textField was moved to the same line as the previous textField in order to save space vertically. The Sign In button was implemented to dismiss the Profile Confirmation View.

### Other Tidbits

* A ProfileService was implemented to fake a request being made to create the profile. This service delays for 2 seconds and then randomly will throw an error for the app to handle. Errors are presented as errors informing the user to try again.
* TextField validation was handled for each Text Field. The password, email, and website were implemented as required fields and will display an error if left blank. Emails were validated with a loose regex.


## What Next?

* Given more time to invest in this project I would first implement a debug view allowing for modifying some of the test settings (i.e. Profile service failure rates, validation conditions, etc)
* Actually implement a profile service in some form.
* Add the ability to tap the website link after creation to navigate to the website.
* Implement a login screen
* Discuss with product what features are most important.
* Add more unit tests.  

 
