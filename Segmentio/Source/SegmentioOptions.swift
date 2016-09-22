//
//  SegmentioOptions.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko
//  Copyright © 2016 Yalantis Mobile. All rights reserved.
//

import UIKit

// MARK: - Item

public struct SegmentioItem {
    var title: String?
    var image: UIImage?
    
    public init(title: String?, image: UIImage?) {
        self.title = title
        self.image = image
    }
    
}

// MARK: - Content view

public struct SegmentioState {
    var backgroundColor: UIColor
    var titleFont: UIFont
    var titleTextColor: UIColor
    
    public enum DefaultState {
        case Normal
        case Selected
        case Highlighted
    }
    
    public init(
        backgroundColor: UIColor = UIColor.clearColor(),
        // FIXME : Add custom font
        //titleFont: UIFont = UIFont.systemFontOfSize(UIFont.smallSystemFontSize()),
        titleFont: UIFont = UIFont.inactiveFont(),
        titleTextColor: UIColor = UIColor.inactiveTextColor() ) {
        self.backgroundColor = UIColor.backgroundColor()
        self.titleFont = titleFont
        self.titleTextColor = titleTextColor
    }
    
    public init(state: DefaultState) {
        switch state {
        case .Normal:
            self.titleFont = UIFont.inactiveFont()
            self.titleTextColor = UIColor.inactiveTextColor()
            break
        case .Selected:
            self.titleFont = UIFont.activeFont()
            self.titleTextColor = UIColor.activeTextColor()
            break
        case .Highlighted:
            self.titleFont = UIFont.activeFont()
            self.titleTextColor = UIColor.activeTextColor()
            break
        }
        self.backgroundColor = UIColor.backgroundColor()
    }
    
}

// MARK: - Indicator

public enum SegmentioIndicatorType {
    case Top, Bottom
}

public struct SegmentioIndicatorOptions {
    var type: SegmentioIndicatorType
    var ratio: CGFloat
    var height: CGFloat
    var color: UIColor
    
    public init(
        type: SegmentioIndicatorType = .Bottom,
        ratio: CGFloat = 1.0,
        height: CGFloat = 1.0,
        // FIXME : Add custom color
        color: UIColor = UIColor.indicatorColor()) {
        self.type = type
        self.ratio = ratio
        self.height = height
        self.color = color
    }
    
}

// MARK: - Control options

public enum SegmentioStyle: String {
    case OnlyLabel, OnlyImage, ImageOverLabel, ImageUnderLabel, ImageBeforeLabel, ImageAfterLabel
    
    public static let allStyles = [
        OnlyLabel,
        OnlyImage,
        ImageOverLabel,
        ImageUnderLabel,
        ImageBeforeLabel,
        ImageAfterLabel
    ]
    
    public func isWithText() -> Bool {
        switch self {
        case .OnlyLabel, .ImageOverLabel, .ImageUnderLabel, .ImageBeforeLabel, .ImageAfterLabel:
            return true
        default:
            return false
        }
    }
    
    public func isWithImage() -> Bool {
        switch self {
        case .ImageOverLabel, .ImageUnderLabel, .ImageBeforeLabel, .ImageAfterLabel, .OnlyImage:
            return true
        default:
            return false
        }
    }
}

public typealias SegmentioStates = (defaultState: SegmentioState, selectedState: SegmentioState, highlightedState: SegmentioState)

public struct SegmentioOptions {
    var backgroundColor: UIColor
    var maxVisibleItems: Int
    var scrollEnabled: Bool
    var indicatorOptions: SegmentioIndicatorOptions?
    var imageContentMode: UIViewContentMode
    var labelTextAlignment: NSTextAlignment
    var states: SegmentioStates
    
    public init() {
        self.maxVisibleItems = 2
        self.backgroundColor = UIColor.backgroundColor()
        self.scrollEnabled = false
        self.indicatorOptions = SegmentioIndicatorOptions()
        self.imageContentMode = .Center
        self.labelTextAlignment = .Center
        self.states = SegmentioStates(
            defaultState: SegmentioState(state: .Normal),
            selectedState: SegmentioState(state: .Selected),
            highlightedState: SegmentioState(state: .Highlighted)
        )
    }
    
    public init(backgroundColor: UIColor, maxVisibleItems: Int, scrollEnabled: Bool, indicatorOptions: SegmentioIndicatorOptions?, imageContentMode: UIViewContentMode, labelTextAlignment: NSTextAlignment, segmentStates: SegmentioStates) {
        self.backgroundColor = backgroundColor
        self.maxVisibleItems = maxVisibleItems
        self.scrollEnabled = scrollEnabled
        self.indicatorOptions = indicatorOptions
        self.imageContentMode = imageContentMode
        self.labelTextAlignment = labelTextAlignment
        self.states = segmentStates
    }
    
    public init(maxVisibleItems: Int) {
        self.maxVisibleItems = maxVisibleItems
        self.backgroundColor = UIColor.backgroundColor()
        self.scrollEnabled = false
        self.indicatorOptions = SegmentioIndicatorOptions()
        self.imageContentMode = .Center
        self.labelTextAlignment = .Center
        self.states = SegmentioStates(
            defaultState: SegmentioState(state: .Normal),
            selectedState: SegmentioState(state: .Selected),
            highlightedState: SegmentioState(state: .Highlighted)
        )
    }
    
}