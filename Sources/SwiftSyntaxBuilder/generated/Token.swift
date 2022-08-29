
//// Automatically Generated by generate-swift-syntax-builder
//// Do Not Edit Directly!
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

import SwiftSyntax

/// Represents `TokenSyntax` in `SwiftSyntaxBuilder`.
/// At the moment, this just wraps `TokenSyntax`, but we can make it store just the information necessary to build a `TokenSyntax` in the future.
public struct Token: SyntaxBuildable, ExpressibleAsBinaryOperatorExpr, ExpressibleAsDeclModifier, ExpressibleAsIdentifierExpr, ExpressibleAsTokenList, ExpressibleAsNonEmptyTokenList {
  let tokenSyntax: TokenSyntax
  let leadingTrivia: Trivia?
  let trailingTrivia: Trivia?
  
  var text: String {
    tokenSyntax.text
  }
  
  public init (tokenSyntax: TokenSyntax, leadingTrivia: Trivia? = nil, trailingTrivia: Trivia? = nil) {
    self.tokenSyntax = tokenSyntax
    self.leadingTrivia = leadingTrivia
    self.trailingTrivia = trailingTrivia
  }
  
  public func withLeadingTrivia(_ leadingTrivia: Trivia) -> Token {
    Token(tokenSyntax: tokenSyntax, leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
  }
  
  public func withTrailingTrivia(_ trailingTrivia: Trivia) -> Token {
    Token(tokenSyntax: tokenSyntax, leadingTrivia: leadingTrivia, trailingTrivia: trailingTrivia)
  }
  
  public func buildToken(format: Format) -> TokenSyntax {
    var result = format._format(syntax: tokenSyntax)
    if let leadingTrivia = leadingTrivia {
      result = result.withLeadingTrivia(leadingTrivia)
    }
    if let trailingTrivia = trailingTrivia {
      result = result.withTrailingTrivia(trailingTrivia)
    }
    return result
  }
  
  public func buildSyntax(format: Format) -> Syntax {
    Syntax(self.buildToken(format: format))
  }
  
  /// Conformance to ExpressibleAsTokenList
  public func createTokenList() -> TokenList {
    return TokenList([self])
  }
  
  /// Conformance to ExpressibleAsNonEmptyTokenList
  public func createNonEmptyTokenList() -> NonEmptyTokenList {
    return NonEmptyTokenList([self])
  }
  
  /// Conformance to ExpressibleAsBinaryOperatorExpr
  public func createBinaryOperatorExpr() -> BinaryOperatorExpr {
    return BinaryOperatorExpr(operatorToken: self)
  }
  
  /// Conformance to ExpressibleAsDeclModifier
  public func createDeclModifier() -> DeclModifier {
    return DeclModifier(name: self)
  }
  
  /// Conformance to ExpressibleAsIdentifierExpr
  public func createIdentifierExpr() -> IdentifierExpr {
    return IdentifierExpr(identifier: self)
  }
  
  /// `Token` conforms to `SyntaxBuildable` via different paths, so we need to pick one default conversion path.
  public func createSyntaxBuildable() -> SyntaxBuildable {
    return createIdentifierExpr()
  }
  
  /// `Token` conforms to `ExprBuildable` via different paths, so we need to pick one default conversion path.
  public func createExprBuildable() -> ExprBuildable {
    return createIdentifierExpr()
  }
}

/// Namespace for commonly used tokens with default trivia.
public extension Token {
  
  /// The `associatedtype` keyword
  static var `associatedtype`: Token {
    Token(tokenSyntax: TokenSyntax.associatedtypeKeyword())
  }
  
  /// The `class` keyword
  static var `class`: Token {
    Token(tokenSyntax: TokenSyntax.classKeyword())
  }
  
  /// The `deinit` keyword
  static var `deinit`: Token {
    Token(tokenSyntax: TokenSyntax.deinitKeyword())
  }
  
  /// The `enum` keyword
  static var `enum`: Token {
    Token(tokenSyntax: TokenSyntax.enumKeyword())
  }
  
  /// The `extension` keyword
  static var `extension`: Token {
    Token(tokenSyntax: TokenSyntax.extensionKeyword())
  }
  
  /// The `func` keyword
  static var `func`: Token {
    Token(tokenSyntax: TokenSyntax.funcKeyword())
  }
  
  /// The `import` keyword
  static var `import`: Token {
    Token(tokenSyntax: TokenSyntax.importKeyword())
  }
  
  /// The `init` keyword
  static var `init`: Token {
    Token(tokenSyntax: TokenSyntax.initKeyword())
  }
  
  /// The `inout` keyword
  static var `inout`: Token {
    Token(tokenSyntax: TokenSyntax.inoutKeyword())
  }
  
  /// The `let` keyword
  static var `let`: Token {
    Token(tokenSyntax: TokenSyntax.letKeyword())
  }
  
  /// The `operator` keyword
  static var `operator`: Token {
    Token(tokenSyntax: TokenSyntax.operatorKeyword())
  }
  
  /// The `precedencegroup` keyword
  static var `precedencegroup`: Token {
    Token(tokenSyntax: TokenSyntax.precedencegroupKeyword())
  }
  
  /// The `protocol` keyword
  static var `protocol`: Token {
    Token(tokenSyntax: TokenSyntax.protocolKeyword())
  }
  
  /// The `struct` keyword
  static var `struct`: Token {
    Token(tokenSyntax: TokenSyntax.structKeyword())
  }
  
  /// The `subscript` keyword
  static var `subscript`: Token {
    Token(tokenSyntax: TokenSyntax.subscriptKeyword())
  }
  
  /// The `typealias` keyword
  static var `typealias`: Token {
    Token(tokenSyntax: TokenSyntax.typealiasKeyword())
  }
  
  /// The `var` keyword
  static var `var`: Token {
    Token(tokenSyntax: TokenSyntax.varKeyword())
  }
  
  /// The `fileprivate` keyword
  static var `fileprivate`: Token {
    Token(tokenSyntax: TokenSyntax.fileprivateKeyword())
  }
  
  /// The `internal` keyword
  static var `internal`: Token {
    Token(tokenSyntax: TokenSyntax.internalKeyword())
  }
  
  /// The `private` keyword
  static var `private`: Token {
    Token(tokenSyntax: TokenSyntax.privateKeyword())
  }
  
  /// The `public` keyword
  static var `public`: Token {
    Token(tokenSyntax: TokenSyntax.publicKeyword())
  }
  
  /// The `static` keyword
  static var `static`: Token {
    Token(tokenSyntax: TokenSyntax.staticKeyword())
  }
  
  /// The `defer` keyword
  static var `defer`: Token {
    Token(tokenSyntax: TokenSyntax.deferKeyword())
  }
  
  /// The `if` keyword
  static var `if`: Token {
    Token(tokenSyntax: TokenSyntax.ifKeyword())
  }
  
  /// The `guard` keyword
  static var `guard`: Token {
    Token(tokenSyntax: TokenSyntax.guardKeyword())
  }
  
  /// The `do` keyword
  static var `do`: Token {
    Token(tokenSyntax: TokenSyntax.doKeyword())
  }
  
  /// The `repeat` keyword
  static var `repeat`: Token {
    Token(tokenSyntax: TokenSyntax.repeatKeyword())
  }
  
  /// The `else` keyword
  static var `else`: Token {
    Token(tokenSyntax: TokenSyntax.elseKeyword())
  }
  
  /// The `for` keyword
  static var `for`: Token {
    Token(tokenSyntax: TokenSyntax.forKeyword())
  }
  
  /// The `in` keyword
  static var `in`: Token {
    Token(tokenSyntax: TokenSyntax.inKeyword())
  }
  
  /// The `while` keyword
  static var `while`: Token {
    Token(tokenSyntax: TokenSyntax.whileKeyword())
  }
  
  /// The `return` keyword
  static var `return`: Token {
    Token(tokenSyntax: TokenSyntax.returnKeyword())
  }
  
  /// The `break` keyword
  static var `break`: Token {
    Token(tokenSyntax: TokenSyntax.breakKeyword())
  }
  
  /// The `continue` keyword
  static var `continue`: Token {
    Token(tokenSyntax: TokenSyntax.continueKeyword())
  }
  
  /// The `fallthrough` keyword
  static var `fallthrough`: Token {
    Token(tokenSyntax: TokenSyntax.fallthroughKeyword())
  }
  
  /// The `switch` keyword
  static var `switch`: Token {
    Token(tokenSyntax: TokenSyntax.switchKeyword())
  }
  
  /// The `case` keyword
  static var `case`: Token {
    Token(tokenSyntax: TokenSyntax.caseKeyword())
  }
  
  /// The `default` keyword
  static var `default`: Token {
    Token(tokenSyntax: TokenSyntax.defaultKeyword())
  }
  
  /// The `where` keyword
  static var `where`: Token {
    Token(tokenSyntax: TokenSyntax.whereKeyword())
  }
  
  /// The `catch` keyword
  static var `catch`: Token {
    Token(tokenSyntax: TokenSyntax.catchKeyword())
  }
  
  /// The `throw` keyword
  static var `throw`: Token {
    Token(tokenSyntax: TokenSyntax.throwKeyword())
  }
  
  /// The `as` keyword
  static var `as`: Token {
    Token(tokenSyntax: TokenSyntax.asKeyword())
  }
  
  /// The `Any` keyword
  static var `any`: Token {
    Token(tokenSyntax: TokenSyntax.anyKeyword())
  }
  
  /// The `false` keyword
  static var `false`: Token {
    Token(tokenSyntax: TokenSyntax.falseKeyword())
  }
  
  /// The `is` keyword
  static var `is`: Token {
    Token(tokenSyntax: TokenSyntax.isKeyword())
  }
  
  /// The `nil` keyword
  static var `nil`: Token {
    Token(tokenSyntax: TokenSyntax.nilKeyword())
  }
  
  /// The `rethrows` keyword
  static var `rethrows`: Token {
    Token(tokenSyntax: TokenSyntax.rethrowsKeyword())
  }
  
  /// The `super` keyword
  static var `super`: Token {
    Token(tokenSyntax: TokenSyntax.superKeyword())
  }
  
  /// The `self` keyword
  static var `self`: Token {
    Token(tokenSyntax: TokenSyntax.selfKeyword())
  }
  
  /// The `Self` keyword
  static var `capitalSelf`: Token {
    Token(tokenSyntax: TokenSyntax.capitalSelfKeyword())
  }
  
  /// The `true` keyword
  static var `true`: Token {
    Token(tokenSyntax: TokenSyntax.trueKeyword())
  }
  
  /// The `try` keyword
  static var `try`: Token {
    Token(tokenSyntax: TokenSyntax.tryKeyword())
  }
  
  /// The `throws` keyword
  static var `throws`: Token {
    Token(tokenSyntax: TokenSyntax.throwsKeyword())
  }
  
  /// The `__FILE__` keyword
  static var `__FILE__`: Token {
    Token(tokenSyntax: TokenSyntax.__file__Keyword())
  }
  
  /// The `__LINE__` keyword
  static var `__LINE__`: Token {
    Token(tokenSyntax: TokenSyntax.__line__Keyword())
  }
  
  /// The `__COLUMN__` keyword
  static var `__COLUMN__`: Token {
    Token(tokenSyntax: TokenSyntax.__column__Keyword())
  }
  
  /// The `__FUNCTION__` keyword
  static var `__FUNCTION__`: Token {
    Token(tokenSyntax: TokenSyntax.__function__Keyword())
  }
  
  /// The `__DSO_HANDLE__` keyword
  static var `__DSO_HANDLE__`: Token {
    Token(tokenSyntax: TokenSyntax.__dso_handle__Keyword())
  }
  
  /// The `_` keyword
  static var `wildcard`: Token {
    Token(tokenSyntax: TokenSyntax.wildcardKeyword())
  }
  
  /// The `(` token
  static var `leftParen`: Token {
    Token(tokenSyntax: TokenSyntax.leftParenToken())
  }
  
  /// The `)` token
  static var `rightParen`: Token {
    Token(tokenSyntax: TokenSyntax.rightParenToken())
  }
  
  /// The `{` token
  static var `leftBrace`: Token {
    Token(tokenSyntax: TokenSyntax.leftBraceToken())
  }
  
  /// The `}` token
  static var `rightBrace`: Token {
    Token(tokenSyntax: TokenSyntax.rightBraceToken())
  }
  
  /// The `[` token
  static var `leftSquareBracket`: Token {
    Token(tokenSyntax: TokenSyntax.leftSquareBracketToken())
  }
  
  /// The `]` token
  static var `rightSquareBracket`: Token {
    Token(tokenSyntax: TokenSyntax.rightSquareBracketToken())
  }
  
  /// The `<` token
  static var `leftAngle`: Token {
    Token(tokenSyntax: TokenSyntax.leftAngleToken())
  }
  
  /// The `>` token
  static var `rightAngle`: Token {
    Token(tokenSyntax: TokenSyntax.rightAngleToken())
  }
  
  /// The `.` token
  static var `period`: Token {
    Token(tokenSyntax: TokenSyntax.periodToken())
  }
  
  /// The `.` token
  static var `prefixPeriod`: Token {
    Token(tokenSyntax: TokenSyntax.prefixPeriodToken())
  }
  
  /// The `,` token
  static var `comma`: Token {
    Token(tokenSyntax: TokenSyntax.commaToken())
  }
  
  /// The `...` token
  static var `ellipsis`: Token {
    Token(tokenSyntax: TokenSyntax.ellipsisToken())
  }
  
  /// The `:` token
  static var `colon`: Token {
    Token(tokenSyntax: TokenSyntax.colonToken())
  }
  
  /// The `;` token
  static var `semicolon`: Token {
    Token(tokenSyntax: TokenSyntax.semicolonToken())
  }
  
  /// The `=` token
  static var `equal`: Token {
    Token(tokenSyntax: TokenSyntax.equalToken())
  }
  
  /// The `@` token
  static var `atSign`: Token {
    Token(tokenSyntax: TokenSyntax.atSignToken())
  }
  
  /// The `#` token
  static var `pound`: Token {
    Token(tokenSyntax: TokenSyntax.poundToken())
  }
  
  /// The `&` token
  static var `prefixAmpersand`: Token {
    Token(tokenSyntax: TokenSyntax.prefixAmpersandToken())
  }
  
  /// The `->` token
  static var `arrow`: Token {
    Token(tokenSyntax: TokenSyntax.arrowToken())
  }
  
  /// The ``` token
  static var `backtick`: Token {
    Token(tokenSyntax: TokenSyntax.backtickToken())
  }
  
  /// The `\` token
  static var `backslash`: Token {
    Token(tokenSyntax: TokenSyntax.backslashToken())
  }
  
  /// The `!` token
  static var `exclamationMark`: Token {
    Token(tokenSyntax: TokenSyntax.exclamationMarkToken())
  }
  
  /// The `?` token
  static var `postfixQuestionMark`: Token {
    Token(tokenSyntax: TokenSyntax.postfixQuestionMarkToken())
  }
  
  /// The `?` token
  static var `infixQuestionMark`: Token {
    Token(tokenSyntax: TokenSyntax.infixQuestionMarkToken())
  }
  
  /// The `"` token
  static var `stringQuote`: Token {
    Token(tokenSyntax: TokenSyntax.stringQuoteToken())
  }
  
  /// The `'` token
  static var `singleQuote`: Token {
    Token(tokenSyntax: TokenSyntax.singleQuoteToken())
  }
  
  /// The `"""` token
  static var `multilineStringQuote`: Token {
    Token(tokenSyntax: TokenSyntax.multilineStringQuoteToken())
  }
  
  /// The `#keyPath` keyword
  static var `poundKeyPath`: Token {
    Token(tokenSyntax: TokenSyntax.poundKeyPathKeyword())
  }
  
  /// The `#line` keyword
  static var `poundLine`: Token {
    Token(tokenSyntax: TokenSyntax.poundLineKeyword())
  }
  
  /// The `#selector` keyword
  static var `poundSelector`: Token {
    Token(tokenSyntax: TokenSyntax.poundSelectorKeyword())
  }
  
  /// The `#file` keyword
  static var `poundFile`: Token {
    Token(tokenSyntax: TokenSyntax.poundFileKeyword())
  }
  
  /// The `#fileID` keyword
  static var `poundFileID`: Token {
    Token(tokenSyntax: TokenSyntax.poundFileIDKeyword())
  }
  
  /// The `#filePath` keyword
  static var `poundFilePath`: Token {
    Token(tokenSyntax: TokenSyntax.poundFilePathKeyword())
  }
  
  /// The `#column` keyword
  static var `poundColumn`: Token {
    Token(tokenSyntax: TokenSyntax.poundColumnKeyword())
  }
  
  /// The `#function` keyword
  static var `poundFunction`: Token {
    Token(tokenSyntax: TokenSyntax.poundFunctionKeyword())
  }
  
  /// The `#dsohandle` keyword
  static var `poundDsohandle`: Token {
    Token(tokenSyntax: TokenSyntax.poundDsohandleKeyword())
  }
  
  /// The `#assert` keyword
  static var `poundAssert`: Token {
    Token(tokenSyntax: TokenSyntax.poundAssertKeyword())
  }
  
  /// The `#sourceLocation` keyword
  static var `poundSourceLocation`: Token {
    Token(tokenSyntax: TokenSyntax.poundSourceLocationKeyword())
  }
  
  /// The `#warning` keyword
  static var `poundWarning`: Token {
    Token(tokenSyntax: TokenSyntax.poundWarningKeyword())
  }
  
  /// The `#error` keyword
  static var `poundError`: Token {
    Token(tokenSyntax: TokenSyntax.poundErrorKeyword())
  }
  
  /// The `#if` keyword
  static var `poundIf`: Token {
    Token(tokenSyntax: TokenSyntax.poundIfKeyword())
  }
  
  /// The `#else` keyword
  static var `poundElse`: Token {
    Token(tokenSyntax: TokenSyntax.poundElseKeyword())
  }
  
  /// The `#elseif` keyword
  static var `poundElseif`: Token {
    Token(tokenSyntax: TokenSyntax.poundElseifKeyword())
  }
  
  /// The `#endif` keyword
  static var `poundEndif`: Token {
    Token(tokenSyntax: TokenSyntax.poundEndifKeyword())
  }
  
  /// The `#available` keyword
  static var `poundAvailable`: Token {
    Token(tokenSyntax: TokenSyntax.poundAvailableKeyword())
  }
  
  /// The `#unavailable` keyword
  static var `poundUnavailable`: Token {
    Token(tokenSyntax: TokenSyntax.poundUnavailableKeyword())
  }
  
  /// The `#fileLiteral` keyword
  static var `poundFileLiteral`: Token {
    Token(tokenSyntax: TokenSyntax.poundFileLiteralKeyword())
  }
  
  /// The `#imageLiteral` keyword
  static var `poundImageLiteral`: Token {
    Token(tokenSyntax: TokenSyntax.poundImageLiteralKeyword())
  }
  
  /// The `#colorLiteral` keyword
  static var `poundColorLiteral`: Token {
    Token(tokenSyntax: TokenSyntax.poundColorLiteralKeyword())
  }
  static func `integerLiteral`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.integerLiteral(text))
  }
  static func `floatingLiteral`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.floatingLiteral(text))
  }
  static func `stringLiteral`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.stringLiteral(text))
  }
  static func `regexLiteral`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.regexLiteral(text))
  }
  static func `unknown`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.unknown(text))
  }
  static func `identifier`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.identifier(text))
  }
  static func `unspacedBinaryOperator`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.unspacedBinaryOperator(text))
  }
  static func `spacedBinaryOperator`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.spacedBinaryOperator(text))
  }
  static func `postfixOperator`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.postfixOperator(text))
  }
  static func `prefixOperator`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.prefixOperator(text))
  }
  static func `dollarIdentifier`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.dollarIdentifier(text))
  }
  static func `contextualKeyword`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.contextualKeyword(text))
  }
  static func `rawStringDelimiter`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.rawStringDelimiter(text))
  }
  static func `stringSegment`(_ text: String) -> Token {
    Token(tokenSyntax: TokenSyntax.stringSegment(text))
  }
  
  /// The `)` token
  static var `stringInterpolationAnchor`: Token {
    Token(tokenSyntax: TokenSyntax.stringInterpolationAnchorToken())
  }
  
  /// The `yield` token
  static var `yield`: Token {
    Token(tokenSyntax: TokenSyntax.yieldToken())
  }
  
  /// The `eof` token
  static var eof: Token {
    Token(tokenSyntax: TokenSyntax.eof())
  }
  
  /// The `open` contextual token
  static var open: Token {
    Token(tokenSyntax: TokenSyntax.contextualKeyword("open").withTrailingTrivia(.space))
  }
}
