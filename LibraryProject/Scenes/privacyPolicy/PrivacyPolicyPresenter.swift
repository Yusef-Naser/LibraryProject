//
//  PrivacyPolicyPresenter.swift
//  LibraryProject
//
//  Created by yusef naser on 29/11/2025.
//

import Foundation
import UIKit

protocol ProPrivacyPolicyView : StatusApi {
    func fetchDate()
    
}

protocol ProPrivacyPolicyPresenter {
    func getPrivacyPolicy()
    func privacyObject() -> ModelPrivacyPolicy?
    func isHTML(_ text: String) -> Bool 
    func convertHtmlTagsToAttributedString (string : String) -> NSAttributedString?
}


class PrivacyPolicyPresenter : ProPrivacyPolicyPresenter {
    
    weak var view : ProPrivacyPolicyView?
    private let interactor = PrivacyPolicyInteractor()
    
    private var modelPrivacy : ModelPrivacyPolicy?
    
    init(view: ProPrivacyPolicyView? = nil) {
        self.view = view
    }
    
    func getPrivacyPolicy() {
        self.view?.showLoading()
        
        interactor.getPrivacyPolicy { data , error, statusCode in
            self.view?.hideLoading()
            guard let data = data else {
                return
            }
            self.modelPrivacy = data
            self.view?.fetchDate()
        }
    }
    
    func privacyObject() -> ModelPrivacyPolicy? {
        return modelPrivacy
    }
    
    func isHTML(_ text: String) -> Bool {
        let pattern = "<[^>]+>"   // أي شيء مثل <tag>
        return text.range(of: pattern, options: .regularExpression) != nil
    }
    
    func convertHtmlTagsToAttributedString (string : String) -> NSAttributedString? {
        if let data = string.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]

            if let attributedText = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil) {
                adjustFontsIfMinimumIs15(in: attributedText)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment =  (SharedData.instance.getLangauge().contains(LanguageEnum.en.rawValue) ) ? .left : .right

                attributedText.addAttribute(.paragraphStyle,
                                        value: paragraphStyle,
                                        range: NSRange(location: 0, length: attributedText.length))
                
                attributedText.addAttribute(.foregroundColor, value: Colors.colorText, range: NSRange(location: 0, length: attributedText.length))
                return attributedText
            }
        }
        return nil
    }
    
    func adjustFontsIfMinimumIs15(in attributed: NSMutableAttributedString) {
        var sizes: [CGFloat] = []

        attributed.enumerateAttribute(.font,
                                      in: NSRange(location: 0, length: attributed.length),
                                      options: []) { value, _, _ in
            if let font = value as? UIFont {
                sizes.append(font.pointSize)
            }
        }

        guard let minSize = sizes.min() else { return }

        guard minSize < 15 else { return }

        let increaseAmount: CGFloat = 5

        attributed.enumerateAttribute(.font,
                                      in: NSRange(location: 0, length: attributed.length),
                                      options: []) { value, range, _ in
            if let oldFont = value as? UIFont {
                //let newFont = oldFont.withSize(oldFont.pointSize + increaseAmount)
                let isBold = oldFont.fontDescriptor.symbolicTraits.contains(.traitBold)

                   let newSize = oldFont.pointSize + increaseAmount
                   var newFont: UIFont

                   if isBold {
                       newFont = UIFont.bold(size: newSize)
                   } else {
                       newFont = UIFont.regular(size: newSize)
                   }
                attributed.addAttribute(.font, value: newFont, range: range)
            }
        }
    }

}
