# WaterTracker

https://github.com/user-attachments/assets/7514bd25-b7d6-4d3a-8527-75a4bd7362aa

### Walkthrough

1. After creating an Xcode project, you should see a file that looks like this. This marks the entry point of our application - indicated by `@main`. The view we present inside `WindowGroup` is what will be displayed when the app first launches.
    * `@main` notifies our system that the application starts here.
    * The `App` protocol you see provides a (hidden) default implementation of the `main()` method which the system calls to launch.
    * Don't worry much about the details - it simply helps to know how the system processes your app.
    * PS: `LandingView` is a view we created to replace the default `ContentView` file. Our landing screen will be defined there.

```swift
// WaterTrackerCompleteApp.swift
import SwiftUI

@main
struct WaterTrackerCompleteApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
```

2. Let's build the `LandingView` below.

<img src="https://github.com/user-attachments/assets/bcd8de87-207f-40a4-8c12-136781f140ad" alt="image" width="300">

3. We start off by centrally placing two buttons in the center. Each button takes in a title and `action` closure.
    * We could decide to provide a custom label for this button using the `label` closure: `Button(action: { }) { (label goes here) }`. We'll stick with a system button design using the `buttonStyle` view modifier. It allows us to neatly specify our button style by providing an object conforming to the `PrimitiveButtonStyle` protocol.
```swift
struct LandingView: View {
    
    var body: some View {
                
            VStack(spacing: 30) {
                Button("Consumption History", action: {
                })
                .buttonStyle(BorderedButtonStyle())
                
                Button("Add hydrator", action: {
                })
                .buttonStyle(BorderedButtonStyle())
            }
       
    }
}
```
4. Since we want our app to have navigation, and the `LandingView` kicks off our navigation flow, we'll wrap our view in a `NavigationStack`.
    * This component doesn't manipulate the view, however it allows us to use view modifiers such as `navigationTitle` to seamlessly provide screen headers.
    * `navigationBarTitleDisplayMode` specifies the presentation of the navigation title.
    * It also allows us to transition to new views with button-like components called `NavigationLink` or view modifiers such as `.navigationDestination`.
  
```swift
struct LandingView: View {
    
    var body: some View {
        NavigationStack {
                
            VStack(spacing: 30) {
                Button("Consumption History", action: {
                })
                .buttonStyle(BorderedButtonStyle())
                
                Button("Add hydrator", action: {
                })
                .buttonStyle(BorderedButtonStyle())
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}
```
5. In progress ...
