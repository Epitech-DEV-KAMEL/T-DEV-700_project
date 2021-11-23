# Architecture Decision

Final chose : Clean architecture

## Pros and Cons

**Pros**
- Consistent business logic througt the app
- Swappable data persistence, third-party library, and presentation
- Promotes more testable design patterns (Core business logic tends to always be testable)
- Easy to maintain

**Cons**
- Requires more intentional design (you can't reference data persistence APIs directly in your business logic)
- Due to the business logic being agnostic of the outer layers you can loose optimizations in being closer to library features and implementations with the benefit of looser coupling
- Can be overkill when only a CRUD app is needed
- Need a lot more class or/and files

## Why chose Clean architecture

Mainly, because we want our code to be testable and maintenable.
Moreover, this allow us to swap repository with a fake one which permit us to develop this app with fake data without call the API.

## How it work ?

We have to main directories :
- `core` directory: where are all the files shared by features
- `features` directory: where all the features are splited

Every "feature" of the app will be divided into 3 layers - `presentation`, `domain` and `data`.

```
lib
├─ core
└─ feature
   ├─ data
   ├─ domain
   └─ presentation
```

### Presentation
This is the stuff you're used to any mobile app. This is code of the user interface. You obviously need widgets to display something on the screen. These widgets then dispatch events to the Bloc and listen for states.

In this layer, you will have 3 directories. The first one is the `widgets` directory. There are reusable components used to build the `pages` which is the second directory. And finally, we have the third one, the `bloc` directory. Bloc contain user interface logic. If you don't know anything about bloc architecture check this out : https://bloclibrary.dev/#/gettingstarted

```
presentation
├─ bloc
├─ pages
└─ widgets
```

### Domain
Domain is the inner layer which shouldn't be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic (use cases) and business objects (entities). **It should be totally independent of every other layer.**

In this layer, you will have 3 directories. The first one is the `entities` directory. As explained before, entities are business objects which mean there are used only in domain layer. The second one is the `usecases` directory. This directory will contain all use cases of the current feature. Use cases are classes which encapsulate all the business logic of a particular use case of the app (e.g. GetCartArticles). Finally, the third one is the `repositories` which defined bunch of contract between `domain` layer and the `data` layer. Contracts are interfaces or abstract classes, and will be implemented by the `data` layers.

```
domain
├─ entities
├─ repositories  <= contracts only (abstract classes or interfaces)
└─ usecases
```

### Data
The data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources (one is usually for getting remote data, API by example, and the other for caching that data). Repository is where you decide if you return fresh or cached data, when to cache it and so on.

Data sources don't return Entities but return Models. The reason behind this is that transforming raw data (e.g JSON) into Dart objects requires some JSON conversion code. We don't want this JSON-specific code inside the domain Entities. And then, what if we decide to switch to XML?

Therefore, we create Model classes which extend Entities and add some specific functionality (toJson, fromJson) or maybe additional fields.

```
data
├─ datasources
│  ├─ local      <= cached data or hard drive sources
│  └─ remote     <= API, socket, ...
├─ models
└─ repositories  <= Implement domain repositories contrats
```
