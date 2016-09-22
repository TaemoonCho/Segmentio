//
//  SegmentioCell.swift
//  Segmentio
//
//  Created by Dmitriy Demchenko
//  Copyright © 2016 Yalantis Mobile. All rights reserved.
//

import UIKit

class SegmentioCell: UICollectionViewCell {
    
    let padding: CGFloat = 8
    let segmentTitleLabelHeight: CGFloat = 22
    
    var segmentTitleLabel: UILabel?
    var segmentImageView: UIImageView?
    
    var topConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var cellSelected = false
    
    private var options = SegmentioOptions()
    private var style = SegmentioStyle.ImageOverLabel
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        
        set {
            if newValue != highlighted {
                super.highlighted = newValue
                
                let highlightedState = options.states.highlightedState
                let defaultState = options.states.defaultState
                let selectedState = options.states.selectedState
                
                if style.isWithText() {
                    let highlightedTitleTextColor = cellSelected ? selectedState.titleTextColor : defaultState.titleTextColor
                    let highlightedTitleFont = cellSelected ? selectedState.titleFont : defaultState.titleFont
                    
                    segmentTitleLabel?.textColor = highlighted ? highlightedState.titleTextColor : highlightedTitleTextColor
                    segmentTitleLabel?.font = highlighted ? highlightedState.titleFont : highlightedTitleFont
                }
                
                backgroundColor = highlighted ? highlightedState.backgroundColor : defaultState.backgroundColor
            }
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        segmentImageView = UIImageView(frame: CGRectZero)
        if let segmentImageView = segmentImageView {
            contentView.addSubview(segmentImageView)
        }
        
        segmentTitleLabel = UILabel(frame: CGRectZero)
        if let segmentTitleLabel = segmentTitleLabel {
            contentView.addSubview(segmentTitleLabel)
        }
        
        segmentImageView?.translatesAutoresizingMaskIntoConstraints = false
        segmentTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        segmentImageView?.layer.masksToBounds = true
        segmentTitleLabel?.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        
        setupConstraintsForSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        switch style {
        case .OnlyLabel:
            segmentTitleLabel?.text = nil
        case .OnlyImage:
            segmentImageView?.image = nil
        default:
            segmentTitleLabel?.text = nil
            segmentImageView?.image = nil
        }
    }
    
    // MARK: - Configure
    
    func configure(content content: SegmentioItem, style: SegmentioStyle, options: SegmentioOptions, isLastCell: Bool) {
        self.options = options
        self.style = style
        setupContent(content: content)
        
        if let indicatorOptions = self.options.indicatorOptions {
            setupConstraint(indicatorOptions: indicatorOptions)
        }
        
    }
    
    func configure(selected selected: Bool) {
        cellSelected = selected
        
        let selectedState = options.states.selectedState
        let defaultState = options.states.defaultState
        
        if style.isWithText() {
            segmentTitleLabel?.textColor = selected ? selectedState.titleTextColor : defaultState.titleTextColor
            segmentTitleLabel?.font = selected ? selectedState.titleFont : defaultState.titleFont
        }
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.borderColor().CGColor
    }
    
    func setupConstraintsForSubviews() {
        return // implement in subclasses
    }
    
    // MARK: - Private functions
    
    private func setupContent(content content: SegmentioItem) {
        if style.isWithImage() {
            segmentImageView?.contentMode = options.imageContentMode
            segmentImageView?.image = content.image
        }
        
        if style.isWithText() {
            segmentTitleLabel?.textAlignment = options.labelTextAlignment
            let defaultState = options.states.defaultState
            segmentTitleLabel?.textColor = defaultState.titleTextColor
            segmentTitleLabel?.font = defaultState.titleFont
            segmentTitleLabel?.text = content.title
        }
    }
    
    private func setupConstraint(indicatorOptions indicatorOptions: SegmentioIndicatorOptions) {
        switch indicatorOptions.type {
        case .Top:
            topConstraint?.constant = padding + indicatorOptions.height
        case .Bottom:
            bottomConstraint?.constant = padding + indicatorOptions.height
        }
    }
}