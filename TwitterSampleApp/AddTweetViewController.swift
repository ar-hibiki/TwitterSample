//
//  AddTweetViewController.swift
//  TwitterSampleApp
//
//  Created by 荒川響 on 2022/06/06.
//

import Foundation
import UIKit
import RealmSwift

class AddTweetViewController: UIViewController {
    @IBOutlet weak var CountText: UILabel!
    @IBOutlet weak var TweetTextView: UITextView!
    @IBOutlet weak var TweetIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conTweetIcon()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ツイートする", style: .plain, target: nil, action: #selector(toTweetView))
        self.TweetTextView.becomeFirstResponder()
        self.TweetTextView.delegate = self
        invalidateButton()
        
    }
    
    func conTweetIcon() {
        TweetIcon.layer.cornerRadius = 20
    }
    
    //「ツイートする」を押した時の挙動
    @objc func toTweetView(_sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        tweet()
    }
    
    let tweetData = TweetDataModel()
    //ツイートする
    func tweet() {
        let realm = try! Realm()
        try! realm.write {
            tweetData.content = TweetTextView.text
            tweetData.recordTime = Date().timeIntervalSince1970
            realm.add(tweetData)
        }
    }
    
    func invalidateButton() {
        if TweetTextView.text.count < 1 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    //テストコード
    func output(text: String) -> Bool {
        var isActive = true
        var testText = TweetTextView?.text
        testText = text
        if testText?.count ?? 0 <= 140 {
        } else if testText?.count ?? 0 > 140 {
            isActive = false
        }
        return isActive
    }
    
    
}

extension AddTweetViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentLines = TweetTextView.text.components(separatedBy: .newlines)
        let newLines = text.components(separatedBy: .newlines)
        let lines = currentLines.count + newLines.count - 1
        return TweetTextView.text.count + (text.count - range.length) <= 140 && lines < 18
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.CountText.text = "\(140 - TweetTextView.text.count )"
       invalidateButton()
    }
}
