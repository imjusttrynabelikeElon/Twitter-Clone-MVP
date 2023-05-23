//
//  CustomPresentationController.swift
//  twitter
//
//  Created by Karon Bell on 5/15/23.
//

import Foundation
import UIKit
//


class CustomPresentationController: UIPresentationController {
    private var dimmingView: UIView?
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView?.bounds ?? .zero
        presentedViewFrame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = containerBounds.width / 235 - presentedViewFrame.width / 4 // Center the presented view horizontally
        presentedViewFrame.origin.y = containerBounds.height / 15 - presentedViewFrame.height / 15 // Center the presented view vertically
        
        return presentedViewFrame
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        // Add a dimming view to the container view
        let dimmingView = UIView(frame: containerView.bounds)
        dimmingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView.alpha = 0
        containerView.addSubview(dimmingView)
        self.dimmingView = dimmingView
        
        // Add tap gesture recognizer to the dimming view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        dimmingView.addGestureRecognizer(tapGesture)
        
        // Fade in the dimming view
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            
            dimmingView.alpha = 1
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        // Fade out the dimming view
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView?.alpha = 0
        }, completion: { _ in
            // Dismiss the presented view controller horizontally
            UIView.transition(with: self.presentedViewController.view, duration: 10.1, options: .curveEaseOut, animations: {
                self.presentedViewController.dismiss(animated: true, completion: nil)
            }, completion: nil)
        })
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            presentingViewController.modalTransitionStyle = .flipHorizontal
            UIView.transition(with: presentingViewController.view, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }
    }
    
    
    @objc private func dimmingViewTapped() {
        UIView.animate(withDuration: 0.3, animations: {
            self.presentedViewController.view.frame.origin.x = -(self.containerView?.bounds.width ?? 0)
            self.dimmingView?.alpha = 0
        }, completion: { _ in
            self.presentingViewController.dismiss(animated: false, completion: nil)
        })
    }

}
