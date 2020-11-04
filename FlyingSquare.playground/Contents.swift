import UIKit
import PlaygroundSupport

let squareOriginalColor = UIColor(.green)

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .orange

PlaygroundPage.current.liveView = liveView

let squareFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: squareFrame)
square.backgroundColor = .purple

liveView.addSubview(square)

UIView.animate(withDuration: 3.0) {
    square.backgroundColor = .blue
    
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    
    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    
    square.transform = comboTransform
} completion: { _ in
    UIView.animate(withDuration: 3.0) {
    square.transform = CGAffineTransform.identity
        square.backgroundColor = squareOriginalColor
    }
}

