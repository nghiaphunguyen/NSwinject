# NSwinject 0.1.2
**NSwinjet** provides class Injected<T> - auto inject properties in any class. It is extended from [Swinject](https://github.com/Swinject/Swinject).

# CHANGE LOG

# INSTALLATION

### Pod
```bash
use_frameworks!

pod 'NSwinject'
```

### Carthage
```bash
github 'nghiaphunguyen/NSwinject'
```

# USAGE

```swift
import NSwinject
import Swinject
```

### Example
```swift
protocol Runnable {
    func name() -> String
}

class Car: Runnable {
    func name() -> String {
        return "Car"
    }
}

class Bike: Runnable {
    func name() -> String {
        return "Bike"
    }
}

class Person: AnyObject {
    private let runnableInjected = Injected<Runnable>()
    private let nameInjeted = Injected<String>()
    
    //use "name" to distinguish with another Injected has same type
    private let moreDescriptionInjected  = Injected<String>("desc")
    
    func desc() -> String {
        guard let runnable = self.runnableInjected.value else {
            return ""
        }
        
        guard let name = self.nameInjeted.value else {
            return ""
        }
        
        guard let desc = self.moreDescriptionInjected.value else {
            return ""
        }
        
        return "\(name) has a \(runnable.name()) and \(desc)"
    }
}

let container = Container { container in
            container.register { Bike() as Runnable }
            container.register { "Nghia"}
            container.register("decs") { "it runs so fast." }
        }
        
let person = Person() <- [container] //inject variables from containers to Person object
print(person.desc()) // "Nghia has a Bike and it runs so fast."

```
# LIMITATION
1. Just inject objects don't have parameters.
2. Don't support circle dependencies.