//
//  MutableArray.swift
//  MutableArray
//
//  Created by Daniel Cohen Gindi on 26/02/2020.
//

import Foundation

final public class MutableArray<T: Any> : Collection, ExpressibleByArrayLiteral
{
    public typealias Element = T
    public typealias ArrayLiteralElement = Element
    
    public var internalArray: [Element]
    
    @inlinable required public init() {
        internalArray = []
    }
    
    @inlinable required public init(repeating repeatedValue: Element, count: Int) {
        internalArray = Array<Element>(repeating: repeatedValue, count: count)
    }
    
    @inlinable required public init<S>(_ elements: S) where S : Sequence, MutableArray.Element == S.Element {
        internalArray = Array<Element>(elements)
    }
    
    public init(items: Array<T>) {
        internalArray = items
    }
    
    @inlinable required convenience public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    var array: Array<T> {
        return internalArray
    }
}

public extension MutableArray
{
    @inlinable var capacity: Int { return internalArray.capacity }
    
    @inlinable static func += (lhs: inout MutableArray<Element>, rhs: MutableArray<Element>) {
        lhs.append(contentsOf: rhs)
    }
    
    @inlinable func dropFirst(_ k: Int = 1) -> ArraySlice<Element> {
        return internalArray.dropFirst(k)
    }
    
    @inlinable func dropLast(_ k: Int) -> ArraySlice<Element> {
        return internalArray.dropLast(k)
    }
    
    @inlinable func drop(while predicate: (Element) throws -> Bool) rethrows -> ArraySlice<Element> {
        return try internalArray.drop(while: predicate)
    }
    
    @inlinable var last: Element? { return internalArray.first }
    
    @inlinable func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        return try internalArray.firstIndex(where: predicate)
    }
    
    @inlinable func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try internalArray.last(where: predicate)
    }
    
    @inlinable func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        return try internalArray.lastIndex(where: predicate)
    }
    
    @inlinable func partition(by belongsInSecondPartition: (Element) throws -> Bool) rethrows -> Int {
        return try internalArray.partition(by: belongsInSecondPartition)
    }
    
    @inlinable func shuffled<T>(using generator: inout T) -> MutableArray<Element> where T : RandomNumberGenerator {
        return MutableArray<Element>(internalArray.shuffled(using: &generator))
    }
    
    @inlinable func shuffled() -> MutableArray<Element> {
        return MutableArray<Element>(internalArray.shuffled())
    }
    
    @inlinable func shuffle<T>(using generator: inout T) where T : RandomNumberGenerator {
        return internalArray.shuffle(using: &generator)
    }
    
    @inlinable func shuffle() {
        internalArray.shuffle()
    }
    
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func applying(_ difference: CollectionDifference<Element>) -> MutableArray<Element>? {
        guard let items = internalArray.applying(difference) else { return nil }
        return MutableArray<Element>(items)
    }
    
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func difference<C>(from other: C, by areEquivalent: (C.Element, Element) -> Bool) -> CollectionDifference<Element> where C : BidirectionalCollection, Element == C.Element {
        return internalArray.difference(from: other, by: areEquivalent)
    }
    
    @inlinable var lazy: LazySequence<Array<Element>> { get { return internalArray.lazy} }
    
    @inlinable func swapAt(_ i: Int, _ j: Int) {
        return internalArray.swapAt(i, j)
    }
    
    @inlinable var indices: Range<Int> { return internalArray.indices }
    
    @inlinable subscript<R>(r: R) -> ArraySlice<Element> where R : RangeExpression, Int == R.Bound { get { return internalArray[r]} }
    
    @inlinable subscript(x: (UnboundedRange_) -> ()) -> ArraySlice<Element> { get { return internalArray[x] } }
    
    @inlinable func append(_ newElement: Element) {
        return internalArray.append(newElement)
    }
    
    @inlinable func append<S>(contentsOf newElements: S) where S : Sequence, Element == S.Element {
        return internalArray.append(contentsOf: newElements)
    }
    
    @inlinable func insert(_ newElement: Element, at i: Int) {
        return internalArray.insert(newElement, at: i)
    }
    
    @inlinable func insert<C>(contentsOf newElements: C, at i: Int) where C : Collection, MutableArray.Element == C.Element {
        return internalArray.insert(contentsOf: newElements, at: i)
    }
    
    @inlinable func remove(at position: Int) -> Element {
        return internalArray.remove(at: position)
    }
    
    @inlinable func removeSubrange(_ bounds: Range<Int>) {
        return internalArray.removeSubrange(bounds)
    }
    
    @inlinable func removeFirst(_ k: Int) {
        return internalArray.removeFirst(k)
    }
    
    @inlinable func removeFirst() -> Element {
        return internalArray.removeFirst()
    }
    
    @inlinable func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C : Collection, R : RangeExpression, MutableArray.Element == C.Element, MutableArray.Index == R.Bound {
        return internalArray.replaceSubrange(subrange, with: newElements)
    }
    
    @inlinable func removeSubrange<R>(_ bounds: R) where R : RangeExpression, MutableArray.Index == R.Bound {
        return internalArray.removeSubrange(bounds)
    }
    
    @inlinable func popLast() -> Element? {
        return internalArray.popLast()
    }
    
    @inlinable func removeLast() -> Element {
        return internalArray.removeLast()
    }
    
    @inlinable func removeLast(_ k: Int) {
        return internalArray.removeLast(k)
    }
    
    @inlinable func removeAll(where shouldBeRemoved: (Element) throws -> Bool) rethrows {
        return try internalArray.removeAll(where: shouldBeRemoved)
    }
    
    
    @inlinable func reverse() {
        return internalArray.reverse()
    }
    
    @inlinable func reversed() -> ReversedCollection<Array<Element>> {
        return internalArray.reversed()
    }
    
    @inlinable func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try internalArray.map(transform)
    }
    
    @inlinable func forEach(_ body: (Element) throws -> Void) rethrows {
        return try internalArray.forEach(body)
    }
    
    @inlinable func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try internalArray.first(where: predicate)
    }
    
    @inlinable func enumerated() -> EnumeratedSequence<Array<Element>> {
        return internalArray.enumerated()
    }
    
    @warn_unqualified_access
    @inlinable func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try internalArray.min(by: areInIncreasingOrder)
    }
    
    @warn_unqualified_access
    @inlinable func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try internalArray.max(by: areInIncreasingOrder)
    }
    
    @inlinable func elementsEqual<OtherSequence>(_ other: OtherSequence, by areEquivalent: (Element, OtherSequence.Element) throws -> Bool) rethrows -> Bool where OtherSequence : Sequence {
        return try internalArray.elementsEqual(other, by: areEquivalent)
    }
    
    @inlinable func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try internalArray.contains(where: predicate)
    }
    
    @inlinable func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try internalArray.allSatisfy(predicate)
    }
    
    @inlinable func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        return try internalArray.reduce(initialResult, nextPartialResult)
    }
    
    @inlinable func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result {
        return try internalArray.reduce(into: initialResult, updateAccumulatingResult)
    }
    
    @inlinable func flatMap<SegmentOfResult>(_ transform: (Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence {
        return try internalArray.flatMap(transform)
    }
    
    @inlinable func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        return try internalArray.compactMap(transform)
    }
    
    @inlinable func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> MutableArray<Element> {
        return try MutableArray<Element>(internalArray.sorted(by: areInIncreasingOrder))
    }
    
    @inlinable func sort(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows {
        try internalArray.sort(by: areInIncreasingOrder)
    }
}

/// Default implementations of core requirements
public extension MutableArray
{
    @inlinable var isEmpty: Bool { return internalArray.isEmpty }
    
    @inlinable var first: Element? { return internalArray.first }
    
    @inlinable var underestimatedCount: Int { return internalArray.underestimatedCount }
}

/// Supply the default `makeIterator()` method for `Collection` models
public extension MutableArray
{
    @inlinable func makeIterator() -> IndexingIterator<Array<Element>> {
        return internalArray.makeIterator()
    }
}

/// Default implementation for forward collections.
public extension MutableArray
{
    @inlinable func formIndex(_ i: inout Int, offsetBy distance: Int) {
        return internalArray.formIndex(&i, offsetBy: distance)
    }
    
    @inlinable func formIndex(_ i: inout Int, offsetBy distance: Int, limitedBy limit: Int) -> Bool {
        return internalArray.formIndex(&i, offsetBy: distance, limitedBy: limit)
    }
    
    @inlinable func randomElement<T>(using generator: inout T) -> Element? where T : RandomNumberGenerator {
        return internalArray.randomElement(using: &generator)
    }
    
    @inlinable func randomElement() -> Element? {
        return internalArray.randomElement()
    }
}

extension MutableArray : RangeReplaceableCollection
{
    @inlinable public func reserveCapacity(_ n: Int) {
        return internalArray.reserveCapacity(n)
    }
    
    @inlinable public func removeAll(keepingCapacity keepCapacity: Bool = false) {
        return internalArray.removeAll(keepingCapacity: keepCapacity)
    }
    
    @inlinable public func withContiguousMutableStorageIfAvailable<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) throws -> R) rethrows -> R? {
        return try internalArray.withContiguousMutableStorageIfAvailable(body)
    }
    
    @inlinable public func withContiguousStorageIfAvailable<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R? {
        return try internalArray.withContiguousStorageIfAvailable(body)
    }
}

extension MutableArray : CustomReflectable
{
    public var customMirror: Mirror { return internalArray.customMirror }
}

extension MutableArray : CustomStringConvertible, CustomDebugStringConvertible
{
    public var description: String { return internalArray.description }
    
    public var debugDescription: String { return internalArray.debugDescription }
}

extension MutableArray : RandomAccessCollection, MutableCollection
{
    public typealias Index = Int
    public typealias Indices = Range<Int>
    public typealias Iterator = IndexingIterator<[Element]>
    
    @inlinable public var startIndex: Int { return internalArray.startIndex }
    @inlinable public var endIndex: Int { return internalArray.endIndex }
    
    @inlinable public func index(after i: Int) -> Int {
        return internalArray.index(after: i)
    }
    
    @inlinable public func formIndex(after i: inout Int) {
        internalArray.formIndex(after: &i)
    }
    
    @inlinable public func index(before i: Int) -> Int {
        return internalArray.index(before: i)
    }
    
    @inlinable public func formIndex(before i: inout Int) {
        internalArray.formIndex(before: &i)
    }
    
    @inlinable public func index(_ i: Int, offsetBy distance: Int) -> Int {
        return internalArray.index(i, offsetBy: distance)
    }
    
    @inlinable public func index(_ i: Int, offsetBy distance: Int, limitedBy limit: Int) -> Int? {
        return internalArray.index(i, offsetBy: distance, limitedBy: limit)
    }
    
    @inlinable public func distance(from start: Int, to end: Int) -> Int {
        return internalArray.distance(from: start, to: end)
    }
    
    @inlinable public subscript(index: Int) -> Element {
        get {
            return internalArray[index]
        }
        set(newValue) {
            internalArray[index] = newValue
        }
    }
    
    @inlinable public subscript(bounds: Range<Int>) -> ArraySlice<Element> {
        return internalArray[bounds]
    }
    
    @inlinable public var count: Int { return internalArray.count }
    
    public typealias SubSequence = ArraySlice<Element>
}

public extension MutableArray where Element : StringProtocol {
    func joined(separator: String = "") -> String {
        return internalArray.joined(separator: separator)
    }
}

public extension MutableArray where Element : Sequence {
    @inlinable func joined() -> FlattenSequence<Array<Element>> {
        return internalArray.joined()
    }
    
    @inlinable func joined<Separator>(separator: Separator) -> JoinedSequence<Array<Element>> where Separator : Sequence, Separator.Element == Element.Element {
        return internalArray.joined(separator: separator)
    }
}

public extension MutableArray where Element == String {
    func joined(separator: String = "") -> String {
        return internalArray.joined(separator: separator)
    }
}

public extension MutableArray where Element : Equatable
{
    @inlinable func split(separator: Element, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true) -> [ArraySlice<Element>] {
        return internalArray.split(separator: separator, maxSplits: maxSplits, omittingEmptySubsequences: omittingEmptySubsequences)
    }
    
    @inlinable func firstIndex(of element: Element) -> Int? {
        return internalArray.firstIndex(of: element)
    }
    
    @inlinable func lastIndex(of element: Element) -> Int? {
        return internalArray.lastIndex(of: element)
    }
    
    @available(iOS 13, *)
    func difference<C>(from other: C) -> CollectionDifference<Element> where C : BidirectionalCollection, Element == C.Element {
        return internalArray.difference(from: other)
    }
    
    @inlinable static func != (lhs: MutableArray<Element>, rhs: MutableArray<Element>) -> Bool {
        return lhs.internalArray != rhs.internalArray
    }
    
    @inlinable func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix) -> Bool where PossiblePrefix : Sequence, Element == PossiblePrefix.Element {
        return internalArray.starts(with: possiblePrefix)
    }
    
    @inlinable func elementsEqual<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, Element == OtherSequence.Element {
        return internalArray.elementsEqual(other)
    }
    
    @inlinable func contains(_ element: Element) -> Bool {
        return internalArray.contains(element)
    }
}

public extension MutableArray where Element : Comparable
{
    @warn_unqualified_access
    @inlinable func min() -> Element? { return internalArray.min() }
    
    @warn_unqualified_access
    @inlinable func max() -> Element? { return internalArray.max() }
    
    @inlinable func lexicographicallyPrecedes<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, MutableArray.Element == OtherSequence.Element {
        return internalArray.lexicographicallyPrecedes(other)
    }
    
    @inlinable func sorted() -> MutableArray<Element> {
        return MutableArray<Element>(internalArray.sorted())
    }
    
    @inlinable func sort() {
        internalArray.sort()
    }
}

extension MutableArray : Equatable where Element : Equatable
{
    @inlinable public static func == (lhs: MutableArray<Element>, rhs: MutableArray<Element>) -> Bool {
        return lhs.internalArray == rhs.internalArray
    }
}

extension MutableArray : Hashable where Element : Hashable
{
    @inlinable public func hash(into hasher: inout Hasher) { internalArray.hash(into: &hasher) }
    
    @inlinable public var hashValue: Int { return internalArray.hashValue }
}

extension MutableArray : Encodable where Element : Encodable
{
    @inlinable public func encode(to encoder: Encoder) throws {
        try internalArray.encode(to: encoder)
    }
}

extension MutableArray : Decodable where Element : Decodable
{
    @inlinable convenience public init(from decoder: Decoder) throws {
        self.init(items: try Array<Element>(from: decoder))
    }
}
