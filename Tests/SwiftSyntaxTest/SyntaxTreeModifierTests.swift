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
import SwiftSyntax

fileprivate func cannedVarDecl() -> VariableDeclSyntax {
  let identifierPattern = IdentifierPatternSyntax(
    identifier: .identifier("a")
  )
  let pattern = PatternBindingSyntax(
    pattern: identifierPattern,
    typeAnnotation: TypeAnnotationSyntax(
      colon: .colonToken(trailingTrivia: .space),
      type: SimpleTypeIdentifierSyntax(name: .identifier("Int"))
    )
  )
  return VariableDeclSyntax(
    letOrVarKeyword: .letKeyword(trailingTrivia: .space),
    bindings: PatternBindingListSyntax([pattern])
  )
}

public class SyntaxTreeModifierTests: XCTestCase {

  public func testAccessorAsModifier() {
    var VD = cannedVarDecl()
    XCTAssertEqual("\(VD)", "let a: Int")
    VD.letOrVarKeyword = .varKeyword(trailingTrivia: .space)
    XCTAssertEqual("\(VD)", "var a: Int")
  }
}
