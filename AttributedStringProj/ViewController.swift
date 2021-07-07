//
//  ViewController.swift
//  AttributedStringProj
//
//  Created by Ilya Hamanchuk on 10/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var textLabel: UILabel!
    private let fio = "Латыня Роман Михайлович"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeString = NSMutableAttributedString(string: fio)
        lastNameAttribute(mutab1: attributeString)
        colorLetter(mutab4: attributeString, fioCount: fio)
        displayText(NSAttributedString(attributedString: attributeString))
        // Создайте вашу строку и вызовите метод для визуального отображения. Пример:
        // displayText(NSAttributedString(string: "test"))
    }
    
    private func string(str: String) -> [String] {
        str.split(separator: " ").map {String($0)}
    }
    
    private func lastNameAttribute( mutab1: NSMutableAttributedString) {
        var location = 0
        let length = string(str: fio)
        let lastNameRange = NSRange(location: location, length: length[0].count-1)
        let line: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
        mutab1.addAttributes(line, range: lastNameRange)
        
        location += length[0].count + 1
        let nameRange = NSRange(location: location, length: length[1].count)
        let font: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 40, weight: UIFont.Weight(rawValue: 0.7))
        ]
        mutab1.addAttributes(font, range: nameRange)
        
        location += length[1].count + 1
        let secondNameRange = NSRange(location: location, length: length[2].count)
        let font1: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Baskerville-Italic", size: 15) ?? UIFont.self
        ]
        mutab1.addAttributes(font1, range: secondNameRange)
    }

    private func colorLetter(mutab4: NSMutableAttributedString, fioCount: String) {
        for index in 0..<fioCount.count {
            let range = NSRange(location: index, length: 1)
            let color: [NSAttributedString.Key: Any] = [.foregroundColor: colors()]
            mutab4.addAttributes(color, range: range)
        }
    }
    
    func colors() -> UIColor {
        let colors: [UIColor] = [.red, .blue, .green, .black, .orange]
        let finalColor: UIColor = colors.randomElement() ?? .black
        return finalColor
    }
    
    private func displayText(_ attributedString: NSAttributedString) {
        textLabel.attributedText = attributedString
    }
}
