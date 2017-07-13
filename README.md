## CPU

A toy 8bit virtual CPU written in Swift

### Assembly language

```s
; Set the values to add
set r1, 42
set r2, 32
; Perform the add
add ; The r1 & r2 values are added auto
pts r0 ; Print the value from r0
```

```swift
let parser = Parser(content: str)
let exec = try! parser.parse()
let cpu = CPU()
try exec.run(cpu)
// => 0b01001010 (74)
```
