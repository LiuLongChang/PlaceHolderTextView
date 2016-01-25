//
//  ViewController.swift
//  PlaceHolderTextView
//
//  Created by langyue on 16/1/25.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var textView : PHTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupLabel()
        self.setupTextView()
    }
    
    
    func setupLabel(){
        
        let titleLabel = UILabel(frame: CGRectMake(0,40,self.view.frame.size.width,44))
        titleLabel.text = "自定义textView控件"
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.blackColor()
        self.view.addSubview(titleLabel)
        
    }
    
    
    func setupTextView(){
        
        let textView = PHTextView()
        textView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200)
        textView.backgroundColor = UIColor.lightGrayColor()
        textView.font = UIFont.systemFontOfSize(15)
        //设置占位文字
        textView.placeholder = "这里是占位文字..."
        
        self.view.addSubview(textView)
        self.textView = textView
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange", name: UITextViewTextDidChangeNotification, object: textView)
        
    }
    
    
    func textDidChange(){
        if self.textView.hasText() == true {
            print("文字发生改变----%@",self.textView.text)
        }
    }
    
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

