//
//  main.swift
//  fmpbpaste
//
//  Created by teruhiro on 2021/05/17.
//

import Foundation
import Cocoa

func getPasteboardType(fmType: String) -> String? {
    switch fmType {
    case "BaseTable":
        return "dyn.ah62d4rv4gk8zuxnykk"
    case "Field":
        return "dyn.ah62d4rv4gk8zuxngku"
    case "Group", "Script":
        return "dyn.ah62d4rv4gk8zuxnxkq"
    case "Step":
        return "dyn.ah62d4rv4gk8zuxnxnq"
    case "Layout":
        return "dyn.ah62d4rv4gk8zuxnqgk"
    case "CustomFunction":
        return "dyn.ah62d4rv4gk8zuxngm2"
    default:
        return nil
    }
}

func getFmType(xml: String) -> String? {
    let xml = SWXMLHash.parse(xml)
    for child in xml["fmxmlsnippet"].children {
        if let elem  = child.element?.name {
            return elem
        }
    }
    return nil
}

func setFmPasteboard(input:String) {
    if let fmType = getFmType(xml: input) {
        if let pbType = getPasteboardType(fmType: fmType) {
            NSPasteboard.general.clearContents()
            let pbset = NSPasteboard.general.setString(input, forType: NSPasteboard.PasteboardType(rawValue: pbType))
            if pbset {
                print("Succeeded in saving the clipboard.")
            } else {
                print("Failed to save the clipboard.")
            }
        }
    }
}

func readArguments () -> String? {
    var input: String?

    for index in 0..<CommandLine.arguments.count {
        if index == 0 {
            // do nothing
        } else {
            if input == nil {
                input = CommandLine.arguments[index]
            } else {
                input! += " " + CommandLine.arguments[index]
            }
        }
    }
    return input
}

func readInput () -> String? {
    var input: String?

    while let line = readLine() {
        if input == nil {
            if line.isEmpty { break }
            input = line
        } else {
            input! += "\n" + line
        }
    }
    return input
}

// run
let errorOut : String = "Please provide an argument(FileMaker XML), or pass - to read stdin"
var input: String?

if CommandLine.arguments.count == 1 {
    // error
} else {
    if CommandLine.arguments.count == 2 {
        if CommandLine.arguments[1] == "-" {
            input = readInput()
        } else {
            // error
        }
    } else {
        input = readArguments()
    }
}

if input != nil {
    setFmPasteboard(input: input!)
} else {
    print(errorOut)
}
