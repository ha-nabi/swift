# Swift Code Convension Guide
Swift 개발에 있어 범용적으로 사용할 수 있는 코드 컨벤션 가이드입니다.  

이 가이드는 코드의 일관성을 유지하고, 팀원 간의 협업을 원활하게 하기 위해 만들어졌습니다.

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

- 기본 4 whiteSpace 들여붙는 프로퍼티를 최상단에 선언
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
