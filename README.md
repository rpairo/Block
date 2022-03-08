# Block

![Backdrop](https://user-images.githubusercontent.com/14141324/157339712-dd7aad8d-01e1-4631-80b7-365e6a79d82d.png)

## Build tools & versions used
- Xcode: Version 13.2.1
- iOS: Version 15.2
- SwiftLint: 0.46.4
- GitHub Actions: The app is configured to run tests through GitHub actions automatically.

## Steps to run the app
- Just run the app. It has no dependencies.

## What areas of the app did you focus on?

| Features         | Code               | Design             | QA                      |
|:----------------:|:------------------:|:------------------:|:-----------------------:|
| Searchbar        | Testability        | Transitions        | Continuous Integration  |
| Grouping by team | Scalability        | App Icon           | Stable branch protected |
| Pull to refresh  | Maintainability    | Apple Human UX     | Linter                  |
| Sorting by name  | Decoupling         | UI                 | Unit Testing            |
| Image cache      | Clean Architecture |                    | GitFlow                 |

## Demo
<p align="center">
<img width="300" height="648" src="https://user-images.githubusercontent.com/14141324/157325042-6da552bb-2251-4daf-82af-1ebca37cae81.gif">
</p>

## What was the reason for your focus? What problems were you trying to solve?
- I focused on the maintainability and readability of the code, so that it was easy and fast for the interviewers to understand.
- I focused on scalability to prepare the app in case I have to add new features in the future.
- I focused on fulfilling all the functionalities suggested in the document, to try to satisfy your objectives.
- I ran into a bug with AsyncImage, which aborts the loading of images when scrolling through a list during loading. I found that it is a bug documented by the community, to which apple is trying to put an official solution in the new beta versions of the system: https://developer.apple.com/forums/thread/682498

## How long did you spend on this project?
- I think around 8 hours.

## Did you make any trade-offs for this project? What would you have done differently with more time?
- With the same resources, I think you could implement a detail view of each employee to show all the information.

## What do you think is the weakest part of your project?
- I have pending things to improve: dependency injection or increase test coverage for example.

## Did you copy any code or dependencies? Please make sure to attribute them here!
- Trying to solve the image cache without a third dependency, I found this implementation by Pedro Rojas: [@pitt500](https://github.com/pitt500), on which I based my solution: [Repository Link](https://github.com/pitt500/Pokedex/blob/main/Pokedex/Cache/CacheAsyncImage.swift)


## Is there any other information you’d like us to know?
- I have the project published in this public repository, so you have access to everything. History, Development, Pull Requests, GitHub CI: [Repository Link](https://github.com/rpairo/Block)
- The stable branch (master) is protected by rules. You can only add code to it by Pull Requests, and these in turn have to pass all tests and checks for collisions and inconsistencies.
