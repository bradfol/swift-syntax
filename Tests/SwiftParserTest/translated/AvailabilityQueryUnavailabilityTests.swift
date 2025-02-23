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

// This test file has been translated from swift/test/Parse/availability_query_unavailability.swift

import XCTest

final class AvailabilityQueryUnavailabilityTests: XCTestCase {
  func testAvailabilityQueryUnavailability1() {
    AssertParse(
      """
      // This file is mostly an inverted version of availability_query.swift
      if #unavailable(OSX 10.51) {
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability2() {
    AssertParse(
      """
      // Disallow explicit wildcards.
      if #unavailable(OSX 10.51, *) {} 
      // Disallow use as an expression.
      if (1️⃣#unavailable(OSX 10.51)) {}  
      let x = 3️⃣#unavailable(OSX 10.51)
      (#unavailable(OSX 10.51) ? 1 : 0) 
      if !#unavailable(OSX 10.52) { 
      }
      if let _ = Optional(5), 5️⃣!6️⃣#unavailable(OSX 10.52) {
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: platform wildcard '*' is always implicit in #unavailable, Fix-It replacements: 28 - 29 = ''
        // TODO: Old parser expected error on line 4: #unavailable may only be used as condition of an 'if', 'guard'
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected value in tuple"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected code '#unavailable(OSX 10.51)' in tuple"),
        // TODO: Old parser expected error on line 5: #unavailable may only be used as condition of
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected expression in variable"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "unexpected code before variable"),
        // TODO: Old parser expected error on line 6: #unavailable may only be used as condition of an
        // TODO: Old parser expected error on line 7: #unavailable may only be used as condition of an
        // TODO: Old parser expected error on line 9: #unavailable may only be used as condition
        DiagnosticSpec(locationMarker: "5️⃣", message: "expected pattern in variable"),
        DiagnosticSpec(locationMarker: "6️⃣", message: "expected expression in prefix operator expression"),
        DiagnosticSpec(locationMarker: "6️⃣", message: "extraneous code at top level"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability3() {
    AssertParse(
      """
      if #unavailable(OSX 10.51) 1️⃣&& #unavailable(OSX 10.52) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected ',' joining parts of a multi-clause condition, Fix-It replacements: 27 - 30 = ','
        DiagnosticSpec(message: "unexpected code '&& #unavailable(OSX 10.52)' in 'if' statement")
      ]
    )
  }

  func testAvailabilityQueryUnavailability4() {
    AssertParse(
      """
      if #unavailable 1️⃣{ 
      }2️⃣
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected availability condition
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected '(' in '#unavailable' condition"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ')' to end '#unavailable' condition"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected code block in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability5() {
    AssertParse(
      """
      if #unavailableℹ️( { 
      }1️⃣
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected platform name
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        ),
        DiagnosticSpec(message: "expected code block in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability6() {
    AssertParse(
      """
      if #unavailable() { 1️⃣
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected platform name
        DiagnosticSpec(message: "expected ')' to end '#unavailable' condition"),
        DiagnosticSpec(message: "expected '{' in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability7() {
    AssertParse(
      """
      if #unavailableℹ️(OSX 1️⃣{
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected version number
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        )
      ]
    )
  }

  func testAvailabilityQueryUnavailability8() {
    AssertParse(
      """
      if #unavailable(OSX) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected version number
      ]
    )
  }

  func testAvailabilityQueryUnavailability9() {
    AssertParse(
      """
      if #unavailableℹ️(OSX 10.51 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        )
      ]
    )
  }

  func testAvailabilityQueryUnavailability10() {
    AssertParse(
      """
      if #unavailable(iDishwasherOS 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability11() {
    AssertParse(
      """
      if #unavailable(iDishwasherOS 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability12() {
    AssertParse(
      """
      if #unavailable(macos 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability13() {
    AssertParse(
      """
      if #unavailable(mscos 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability14() {
    AssertParse(
      """
      if #unavailable(macoss 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability15() {
    AssertParse(
      """
      if #unavailable(mac 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability16() {
    AssertParse(
      """
      if #unavailable(OSX 10.51, OSX 10.52) {  
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability17() {
    AssertParse(
      """
      if #unavailable(OSX 10.51, iOS 8.0, *) { }  
      if #unavailable(iOS 8.0) {
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability18() {
    AssertParse(
      """
      if #unavailable(iOSApplicationExtension, unavailable) { // expected-error 2{{expected version number}}
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability19() {
    AssertParse(
      """
      // Should this be a valid spelling since `#unvailable(*)` cannot be written?
      if #unavailable() { 1️⃣
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: expected platform name
        DiagnosticSpec(message: "expected ')' to end '#unavailable' condition"),
        DiagnosticSpec(message: "expected '{' in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability20() {
    AssertParse(
      """
      if #unavailableℹ️(OSX 10 1️⃣{
      }
      """,
      diagnostics: [
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        )
      ]
    )
  }

  func testAvailabilityQueryUnavailability21() {
    AssertParse(
      """
      // Multiple platforms
      if #unavailable(OSX 10.51, iOS 8.0) {
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability22() {
    AssertParse(
      """
      if #unavailableℹ️(OSX 10.51, {
      }1️⃣
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected platform name
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        ),
        DiagnosticSpec(message: "expected code block in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability23() {
    AssertParse(
      """
      if #unavailable(OSX 10.51,) { 1️⃣
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected platform name
        DiagnosticSpec(message: "expected ')' to end '#unavailable' condition"),
        DiagnosticSpec(message: "expected '{' in 'if' statement"),
      ]
    )
  }

  func testAvailabilityQueryUnavailability24() {
    AssertParse(
      """
      if #unavailableℹ️(OSX 10.51, iOS 1️⃣{
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: expected version number
        DiagnosticSpec(
          message: "expected ')' to end '#unavailable' condition",
          notes: [
            NoteSpec(message: "to match this opening '('")
          ]
        )
      ]
    )
  }

  func testAvailabilityQueryUnavailability25() {
    AssertParse(
      """
      if #unavailable(OSX 10.51, iOS 8.0, iDishwasherOS 10.51) { 
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability26() {
    AssertParse(
      """
      if #unavailable(iDishwasherOS 10.51, OSX 10.51) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected warning on line 1: unrecognized platform name 'iDishwasherOS'
      ]
    )
  }

  func testAvailabilityQueryUnavailability27() {
    AssertParse(
      """
      if #unavailable(OSX 10.51 1️⃣|| iOS 8.0) {
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 1: '||' cannot be used in an availability condition
        DiagnosticSpec(message: "unexpected code '|| iOS 8.0' in '#unavailable' condition")
      ]
    )
  }

  func testAvailabilityQueryUnavailability28() {
    AssertParse(
      """
      // Emit Fix-It removing un-needed >=, for the moment.
      if #unavailable(OSX 1️⃣>= 10.51) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: version comparison not needed, Fix-It replacements: 21 - 24 = ''
        DiagnosticSpec(message: "unexpected code '>= 10.51' in '#unavailable' condition")
      ]
    )
  }

  func testAvailabilityQueryUnavailability29() {
    AssertParse(
      """
      // Bool then #unavailable.
      if 1 != 2, #unavailable(iOS 8.0) {}
      """
    )
  }

  func testAvailabilityQueryUnavailability30() {
    AssertParse(
      """
      // Pattern then #unavailable(iOS 8.0) {
      if case 42 = 42, #unavailable(iOS 8.0) {}
      if let _ = Optional(42), #unavailable(iOS 8.0) {}
      """
    )
  }

  func testAvailabilityQueryUnavailability31() {
    AssertParse(
      #"""
      // Allow "macOS" as well.
      if #unavailable(macOS 10.51) {
      }
      """#
    )
  }

  func testAvailabilityQueryUnavailability32() {
    AssertParse(
      """
      // Prevent availability and unavailability being present in the same statement.
      if #unavailable(macOS 10.51), #available(macOS 10.52, *) { 
      }
      if #available(macOS 10.51, *), #unavailable(macOS 10.52) { 
      }
      if #available(macOS 10.51, *), #available(macOS 10.55, *), #unavailable(macOS 10.53) { 
      }
      if #unavailable(macOS 10.51), #unavailable(macOS 10.55), #available(macOS 10.53, *) { 
      }
      if case 42 = 42, #available(macOS 10.51, *), #unavailable(macOS 10.52) { 
      }
      if #available(macOS 10.51, *), case 42 = 42, #unavailable(macOS 10.52) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: #available and #unavailable cannot be in the same statement
        // TODO: Old parser expected error on line 4: #available and #unavailable cannot be in the same statement
        // TODO: Old parser expected error on line 6: #available and #unavailable cannot be in the same statement
        // TODO: Old parser expected error on line 8: #available and #unavailable cannot be in the same statement
        // TODO: Old parser expected error on line 10: #available and #unavailable cannot be in the same statement
        // TODO: Old parser expected error on line 12: #available and #unavailable cannot be in the same statement
      ]
    )
  }

  func testAvailabilityQueryUnavailability33() {
    AssertParse(
      """
      // Allow availability and unavailability to mix if they are not in the same statement.
      if #unavailable(macOS 11) {
        if #available(macOS 10, *) { }
      }
      if #available(macOS 10, *) {
        if #unavailable(macOS 11) { }
      }
      """
    )
  }

  func testAvailabilityQueryUnavailability34() {
    AssertParse(
      """
      // Diagnose wrong spellings of unavailability
      if #available(*) 1️⃣== false { 
      }
      if !2️⃣#available(*) { 
      }
      """,
      diagnostics: [
        // TODO: Old parser expected error on line 2: #available cannot be used as an expression, did you mean to use '#unavailable'?, Fix-It replacements: 4 - 14 = '#unavailable', 18 - 27 = ''
        DiagnosticSpec(locationMarker: "1️⃣", message: "unexpected code '== false' in 'if' statement"),
        // TODO: Old parser expected error on line 4: #available cannot be used as an expression, did you mean to use '#unavailable'?, Fix-It replacements: 4 - 15 = '#unavailable'
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected expression in prefix operator expression"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected code '#available(*)' in 'if' statement"),
      ]
    )
  }

}
