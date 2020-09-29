//
//  SortingAlgorithms.swift
//  
//
//  Created by Nick Xu on 29/9/20.
//

//Bubble Sort
func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    // There is no need to sort the collection if it has less than two elements.
    guard array.count >= 2 else {
        return
    }
    //A single-pass bubbles the lagest value to the end of the collection. Every pass need to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
    for end in (1..<array.count).reversed() {
        var swapped = false
        // This loop performs a single pass; it compares adjacent values and swaps them if needed.
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        //If no values were swapped this pass, the collection must be sorted, and you can exit early.
        if !swapped {
            return
        }
    }
}

//Selection Sort
func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    // There is no need to sort the collection if it has less than two elements.
    guard array.count >= 2 else {
        return
    }

    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

//Insertion Sort
func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    // There is no need to sort the collection if it has less than two elements.
    guard array.count >= 2 else {
        return
    }
    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

//Merge Sort
func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}

func printElement<T>(_ array: [T]) {
    let string = array.map {"\($0)"}
                 .joined(separator: " ")
    print(string)
}
