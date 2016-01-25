//
//  PHTextView.swift
//  PlaceHolderTextView
//
//  Created by langyue on 16/1/25.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class PHTextView: UITextView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    //占位文字
    var placeholder : NSString? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    //占位文字颜色
    var placeholderColor : UIColor?
    
    override internal var text: String! {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override internal var font: UIFont?{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange", name: UITextViewTextDidChangeNotification, object: self)
    }
    
    
    
    func textDidChange(){
        self.setNeedsDisplay()
    }
    
    
    
    override func drawRect(rect: CGRect) {
        
        if self.hasText(){ return};
        
        var attributes : Dictionary<String,AnyObject> = [NSFontAttributeName:self.font!]
        attributes[NSForegroundColorAttributeName] = (self.placeholderColor == nil) ? (self.placeholderColor) : (UIColor .grayColor())
        
        let x : CGFloat = 5
        let width = rect.size.width - 2 * x
        let y : CGFloat = 8
        let height = rect.size.width - 2 * y
        
        let placeholderRect = CGRectMake(x, y, width, height)
        self.placeholder!.drawInRect(placeholderRect, withAttributes: attributes)
        
    }
    
    
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
