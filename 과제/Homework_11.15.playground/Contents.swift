import UIKit

// 도전 과제
// 최대한 줄여보기

// 1.
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

// 답
let someClosure11: (String, String) -> Bool = {$0 > $1}


// 2.
let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}

// 답
let otherClosure1 = {[$0].count}
