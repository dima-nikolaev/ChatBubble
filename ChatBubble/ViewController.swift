//
//  ViewController.swift
//  ChatBubble
//
//  Created by Dima on 3/9/18.
//  Copyright © 2018 Dima Nikolaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
        let green = UIColor(red: 30/255, green: 222/255, blue: 38/255, alpha: 1)
        
        showOutgoingMessage(color: green, text: "An arbitrary text which we use to demonstrate how our label sizes' calculation works.")
        */
        
        showIncomingMessage()
    }
    
    func showIncomingMessage() {
        let halfScreen = view.frame.width / 2
        
        let bubbleImageSize = CGSize(width: halfScreen,
                                     height: halfScreen / 0.75)
        
        let incomingMessageView = UIImageView(frame:
            CGRect(x: 20,
                   y: view.frame.height - bubbleImageSize.height - 86,
                   width: bubbleImageSize.width,
                   height: bubbleImageSize.height))
        
        let bubbleImage = UIImage(named: "incoming-message-bubble")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21))
        
        let maskView = UIImageView(image: bubbleImage)
        maskView.frame = incomingMessageView.bounds
        
        incomingMessageView.image = UIImage(named: "photo")
        incomingMessageView.mask = maskView
        
        view.addSubview(incomingMessageView)
    }
    
    func showOutgoingMessage(color: UIColor, text: String) {
        let label =  UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = text
        
        let constraintRect = CGSize(width: 0.66 * view.frame.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: label.font],
                                            context: nil)
        label.frame.size = CGSize(width: ceil(boundingBox.width),
                                  height: ceil(boundingBox.height))
        
        let bubbleImageSize = CGSize(width: label.frame.width + 28,
                                     height: label.frame.height + 20)
        
        let outgoingMessageView = UIImageView(frame:
            CGRect(x: view.frame.width - bubbleImageSize.width - 20,
                   y: view.frame.height - bubbleImageSize.height - 86,
                   width: bubbleImageSize.width,
                   height: bubbleImageSize.height))
        
        let bubbleImage = UIImage(named: "outgoing-message-bubble")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
                            resizingMode: .stretch)
            .withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        outgoingMessageView.image = bubbleImage
        outgoingMessageView.tintColor = color
        
        view.addSubview(outgoingMessageView)
        
        label.center = outgoingMessageView.center
        
        view.addSubview(label)
    }

}
