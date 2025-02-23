//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import XCTest
@_spi(Testing) import SwiftSyntax

#if DEBUG
final class MemoryLayoutTest: XCTestCase {

  func testMemoryLayouts() throws {
    #if !arch(x86_64) && !arch(arm64)
    throw XCTSkip("Only runs on x86_64 and arm64")
    #endif

    /// This test result is just for tracking the memory footprint of syntax nodes,
    /// and they are totally informative purpose. Although we want to keep the
    /// numbers as low as possible, nothing should rely on them, and are not hard
    /// limits in any way.
    /// If this fails, just update the numbers.
    let expected: [String: SyntaxMemoryLayout.Value] = [
      "RawSyntaxData.Layout": .init(size: 41, stride: 48, alignment: 8),
      "RawSyntaxData.ParsedToken": .init(size: 42, stride: 48, alignment: 8),
      "RawSyntaxData.MaterializedToken": .init(size: 49, stride: 56, alignment: 8),
      "RawSyntaxData": .init(size: 64, stride: 64, alignment: 8),
      "RawSyntax?": .init(size: 8, stride: 8, alignment: 8),

      "SyntaxData": .init(size: 16, stride: 16, alignment: 8),
      "SyntaxData.Info": .init(size: 8, stride: 8, alignment: 8),
      "SyntaxData.Info.Root": .init(size: 8, stride: 8, alignment: 8),
      "SyntaxData.Info.NonRoot": .init(size: 36, stride: 40, alignment: 8),
    ]

    let values = SyntaxMemoryLayout.values
    XCTAssertEqual(values.count, expected.count)
    for exp in expected {
      let actualValue = try XCTUnwrap(values[exp.key], "Missing '\(exp.key)'")
      XCTAssertEqual(actualValue, exp.value, "Matching '\(exp.key)' values")
    }
  }

}
#endif
