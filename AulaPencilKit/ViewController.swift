//
//  ViewController.swift
//  AulaPencilKit
//
//  Created by Rayane Xavier on 07/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController {

    let canvasView: PKCanvasView = PKCanvasView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(canvasView)
        
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        
        // tornar o canvas invisivel
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        
        // zoom com dois dedos
        canvasView.allowsFingerDrawing = true
        
        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.topAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let window = view.window, let toolPicker = PKToolPicker.shared(for: window) else { return }
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
}

