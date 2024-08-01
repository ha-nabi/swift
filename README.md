# Swift Code Convension Guide
Swift 개발에 있어 범용적으로 사용할 수 있는 코드 컨벤션 가이드입니다

이 가이드는 코드의 일관성을 유지하고, 팀원 간의 협업을 원활하게 하기 위해 만들어졌습니다

<br>

## Index
- [Indentation](#indentation)
- [Naming](#naming)
- [Style](#style)
  - [Functions](#functions)
  - [Closures](#closures)
  - [Operators](#operators)
- [Patterns](#patterns)
- [File Organization](#file-organization)

<br>

## Contributors
<a href="https://github.com/kmh5038">
 <img src="https://github.com/kmh5038.png" alt="img" width="50"/>
</a>

<a href="https://github.com/JooYoungNoh">
 <img src="https://github.com/JooYoungNoh.png" alt="img" width="50"/>
</a>

<a href="https://github.com/Phangg">
 <img src="https://github.com/Phangg.png" alt="img" width="50"/>
</a>

<a href="https://github.com/hamfan524">
 <img src="https://github.com/hamfan524.png" alt="img" width="50"/>
</a>

<br>
<br>

## **Indentation**

- 기본 4 whiteSpace 들여쓰기 사용

   <details>

     ```swift
     if exampleCode {
       // ...
     }
     ```

   </details>

 <br>

 ## Naming

 - **타입과 프로토콜의 이름에는 PascalCase를 사용하고, 그 외에는 lowerCamelCase를 사용하기**

     <details>

     ```swift
     protocol SpaceThing {
       // ...
     }

     class SpaceFleet: SpaceThing {

       enum Formation {
         // ...
       }

       class Spaceship {
         // ...
       }

       var ships: [Spaceship] = []
       static let worldName: String = "Earth"

       func addShip(_ ship: Spaceship) {
         // ...
       }
     }

     let myFleet = SpaceFleet()
     ```

     </details>

     <br>

 - `@ViewBuilder` 메서드 경우 PascalCase 사용

     <details>

     ```swift
     @ViewBuilder
     private func ExampleComponent() -> some View {
       ...
     }
     ```

     </details>

     <br>

 - Bool 타입 변수 선언 시, `is` || `has` 로 시작 할 수 있도록 선언

     <details>

     ```swift
     var isShowing: Bool = false
     ```

     </details>

     <br>

 - 동작을 의미하는 변수 및 메서드 선언 시, 동사가 맨 앞으로 오도록 선언

     <details>

     ```swift
     enum Action {
       case showDialog
       ...
     }
     ```

     </details>

     <br>

 - API - `fetch, add, update, delete` 명칭 사용 ( not used - remove, get, create … )

     <details>

     ```swift
     func fetchList() {
       ...
     }
     ```

     </details>

     <br>

 - extension 사용 시, 파일명 `xxxxx +.swift`

     <br>

 ## Style

 - **식별자 바로 뒤에 콜론(:)을 놓고 그 뒤에 공백을 두기**

     <details>

     ```swift
     var something: String = "코드 컨벤션 만들기"

     func addWork(_ work: String) {
       // ...
     }
     ```

     </details>

     <br>

 - **쉽게 추론할 수 있는 유형은 타입 표기 생략하기 ( 객체 생성 )**

     <details>

     ```swift
     // WRONG
     let host: Host = Host()

     // RIGHT
     let host = Host()
     ```

     ```swift
     enum Direction {
       case left
       case right
     }

     func someDirection() -> Direction {
       // WRONG
       return Direction.left

       // RIGHT
       return .left
     }
     ```

     </details>

     <br>

 - `self.` - 네이밍이 겹치지 않는 이상 사용하지 않기

     <details>

     ```swift
     final class Listing {
       init(capacity: Int, allowsPets: Bool) {
       // WRONG
       self.capacity = capacity
       self.isFamilyFriendly = !allowsPets // `self.` not required here

       // RIGHT
       self.capacity = capacity
       isFamilyFriendly = !allowsPets
       }

       private let isFamilyFriendly: Bool
       private var capacity: Int

       private func increaseCapacity(by amount: Int) {
       // WRONG
       self.capacity += amount

       // RIGHT
       capacity += amount

       // WRONG
       self.save()

       // RIGHT
       save()
       }
     }
     ```

     </details>

     <br>

 - 여러 줄이 있는 배열은 각 괄호가 별도의 줄에 있도록 하기 ( 배열 속성 2개 이상의 경우 )

     <details>

     ```swift
     // WRONG
     let rowContent = [listingUrgencyDatesRowContent(),
                       listingUrgencyBookedRowContent(),
                       listingUrgencyBookedShortRowContent()]

     // RIGHT
     let rowContent = [
       listingUrgencyDatesRowContent(),
       listingUrgencyBookedRowContent(),
       listingUrgencyBookedShortRowContent()
     ]
     ```

     </details>

     <br>

 - guard let 구문 - else 문 클로저가 return 이 아닐 경우, 클로저 줄 내려서 사용 
 ( 조건 여러개는 당연히 조건에만 여러 줄 사용 )

     <details>

     ```swift
     guard let xxxx = xxxx else { return }

     guard let xxxx = xxxx,
       xxxx.sdsda.isEmpty,
       xxxx.ssss.isEmpty else { return }

     guard let xxxx = xxxx else { 
       throw abcdError.aaaaa
     }
     ```

     </details>

     <br>

 - switch case 문은 각 case 별로 한줄씩 띄어서 사용

     <details>

     ```swift
     func handle(_ action: SpaceshipAction) {
       switch action {

       case .engageWarpDrive:
       warpDrive.engage()

       case .enableArtificialGravity:
       artificialGravityEngine.enable(strength: .oneG)

       case .scanPlanet(let planet):
       scanner.scan(planet)

       case .handleIncomingEnergyBlast:
       energyShields.engage()
       }
     }
     ```

     </details>

     <br>

 - 한줄 주석과 여러줄 주석을 구분하기

     <details>

     ```swift
     한줄 주석
     //

     여러줄 주석
     ///
     ```

     </details>

     <br>


 ### Functions

 - **함수 정의에서 Void 리턴 타입을 생략하기**

     <details>

     ```swift
     // WRONG
     func doSomething() -> Void {
       ...
     }

     // RIGHT
     func doSomething() {
       ...
     }
     ```

     </details>

     <br>

 - **긴 함수의 호출 ( 파라미터 2개 이상 )**

     <details>

     ```swift
     // WRONG
     universe.generateStars(at: location, count: 5, color: starColor, withAverageDistance: 4)

     // WRONG
     universe.generateStars(at: location,
                            count: 5,
                            color: starColor,
                            withAverageDistance: 4)

     // RIGHT
     universe.generateStars(
       at: location,
       count: 5,
       color: starColor,
       withAverageDistance: 4
     )
     ```

     ```swift
     // RIGHT
     func generateStars(
       at location: Point,
       count: Int,
       color: StarColor,
       withAverageDistance averageDistance: Float
     ) async throws -> String {
       populateUniverse()
     }

     // RIGHT
     func generateStars(
       at location: Point,
       count: Int,
       color: StarColor,
       withAverageDistance averageDistance: Float
     ) {
       populateUniverse()
     }
     ```

     </details>

     <br>

 ### **Closures**

 - **사용하지 않는 클로저 파라미터의 이름은 밑줄(`_`)로 표시하기**

     <details>

     ```swift
     // WRONG
     someAsyncThing() { argument1, argument2, argument3 in
       print(argument3)
     }

     // RIGHT
     someAsyncThing() { _, _, argument3 in
       print(argument3)
     }
     ```

     </details>

     <br>

 ### **Operators**

 - **중위 연산자는 양쪽에 공백이 하나씩 두기 및** 다양한 공백 너비보다는 괄호를 사용하여 연산자가 많은 문을 시각적으로 그룹화하기

     <details>

     ```swift
     // WRONG
     let capacity = 1+2
     let capacity = currentCapacity   ?? 0
     let mask = (UIAccessibilityTraitButton|UIAccessibilityTraitSelected)
     let capacity=newCapacity
     let latitude = region.center.latitude - region.span.latitudeDelta/2.0

     // RIGHT
     let capacity = 1 + 2
     let capacity = currentCapacity ?? 0
     let mask = (UIAccessibilityTraitButton | UIAccessibilityTraitSelected)
     let capacity = newCapacity
     let latitude = region.center.latitude - (region.span.latitudeDelta / 2.0)
     ```

     </details>

     <br>

 - 삼항 연산자의 표현이 너무 길어지면, 줄 내려서 사용하기

     <details>

     ```swift
     let xx = ab ? a : b

     let destinationPlanet = solarSystem.hasPlanetsInHabitableZone ?
         solarSystem.planetsInHabitableZone.first :
         solarSystem.uninhabitablePlanets.first
     ```

     </details>

     <br>

 - 조건이 여러 개의 경우, 각 조건이 별도의 줄에 있도록 하기 ( 조건 2개 이상의 경우 )

     <details>

     ```swift
     // WRONG
     if selectImage != userSaveImage && userNickname != nickname && userManager.uid != "" {
       // ...
     }

     // RIGHT
     if selectImage != userSaveImage &&
        userNickname != nickname && 
        userManager.uid != "" {
       // ...
     }
     ```

     </details>

     <br>

 ## Patterns

 - **열거형에서 `switch`를 사용할 때 `default` case를 사용하지 말기**

     <details>

     ```swift
     // WRONG
     switch trafficLight {
       case .greenLight:
       // Move your vehicle
       default:
       // Stop your vehicle
     }

     // RIGHT
     switch trafficLight {
       case .greenLight:
       // Move your vehicle
       case .yellowLight, .redLight:
       // Stop your vehicle
     }
     ```

     </details>

     <br>

 - **기본 클래스는 `final`**

     <details>

     ```swift
     // WRONG
     class SettingsRepository {
       // ...
     }

     // RIGHT
     final class SettingsRepository {
       // ...
     }
     ```

     </details>

     <br>

 - **한줄일 경우엔`return` 생략**

     <details>

     ```swift
     // WRONG
     ["1", "2", "3"].compactMap { return Int($0) }

     var size: CGSize {
       return CGSize(
       width: 100.0,
       height: 100.0)
     }

     func makeInfoAlert(message: String) -> UIAlertController {
       return UIAlertController(
       title: "ℹ️ Info",
       message: message,
       preferredStyle: .alert)
     }

     var alertTitle: String {
       if issue.severity == .critical {
         return "💥 Critical Error"
       } else {
         return "ℹ️ Info"
     }

     func type(of planet: Planet) -> PlanetType {
       switch planet {
       case .mercury, .venus, .earth, .mars:
         return .terrestrial
       case .jupiter, .saturn, .uranus, .neptune:
         return .gasGiant
       }
     }

     // RIGHT
     ["1", "2", "3"].compactMap { Int($0) }

     var size: CGSize {
       CGSize(
       width: 100.0,
       height: 100.0)
     }

     func makeInfoAlert(message: String) -> UIAlertController {
       UIAlertController(
       title: "ℹ️ Info",
       message: message,
       preferredStyle: .alert)
     }

     var alertTitle: String {
       if issue.severity == .critical {
         "💥 Critical Error"
       } else {
         "ℹ️ Info"
     }

     func type(of planet: Planet) -> PlanetType {
       switch planet {
       case .mercury, .venus, .earth, .mars:
         .terrestrial
       case .jupiter, .saturn, .uranus, .neptune:
         .gasGiant
       }
     }
     ```

     </details>

     <br>


 ## **File Organization**

 - **서로 다른 종류의 프로퍼티 선언 사이에 빈 줄을 추가하기**

     <details>

     ```swift
     // WRONG
     static let gravityEarth: CGFloat = 9.8
     static let gravityMoon: CGFloat = 1.6
     var gravity: CGFloat

     // RIGHT
     static let gravityEarth: CGFloat = 9.8
     static let gravityMoon: CGFloat = 1.6

     var gravity: CGFloat
     ```

     </details>

     <br>

 - import 문 관리

     내부 / 외부 한 줄 띄고 관리 ( 외부를 상단에, 내부를 하단에, test 최하단 )

     a-z 알파벳 순으로

     <details>

     ```swift
     import Constellation
     import DLSPrimitives
     import Epoxy

     import Foundation

     @testable import Epoxy
     ```

     </details>

     <br>

 - 프로퍼티 순서
     - 한줄 띄어서 구분
     - `propertyWrapper` 가 붙는 프로퍼티를 최상단에 선언
    - EnvironmentObject, StateObject, ObservedObject, State, Binding, private 순으로 선언
    - var / let 의 경우, var 를 상단에 let 을 하단에 선언

    <br>
    
    <details>
    
    ```swift
    struct xxx {
      @EnvironmentObject var ...
    		
      @StateObject var ...
    		
      @ObservedObject var ...
    		
      @State var ...
    		
      @Binding var ...
    	
      @Presents var ppp: ... 
    		
      private var ...
    
      var aaa
      var bbb
      var ccc
    		
      let ddd
      let eee
    }
    ```

    </details>

    <br>
    
    - 연산 프로퍼티는 프로퍼티 중 맨 밑에 선언

    <br>

    <details>
    
    ```swift
    // WRONG
    var atmosphere: Atmosphere {
      didSet {
        print("oh my god, the atmosphere changed")
      }
    }
    var gravity: CGFloat
    
    // RIGHT
    var gravity: CGFloat
    var atmosphere: Atmosphere {
      didSet {
        print("oh my god, the atmosphere changed")
      }
    }
    ```

    </details>
    
    <br>
    
- In TCA
    - @Dependency 위치는 Action 과 body 사이에 사용
    - @Dependency 도 알파벳 순으로 선언

    <br>

    <details>
      
    ```swift
    enum Action {
      ...
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.swiftDataService) var swiftData
    
    var body: some ReducerOf<Self> {
    ```

    </details>

    <br>
    
    - 프로퍼티 && 액션
        - 관련 기능끼리 모으는걸 우선시하고, 내부에서는 알파벳 순으로 정렬하기
