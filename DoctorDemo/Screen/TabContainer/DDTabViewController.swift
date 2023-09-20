//
//  ViewController.swift
//  DoctorDemo
//
//  Created by Sanju on 18/09/23.
//

import UIKit

class DDTabViewController: UIViewController {
    var selectedTab: Int = 0
    var fabData: [DDFabCellDataModel] = [
        .init(image: .pencil, title: "Create a post", description: "Share your thoughts with the community"),
        .init(image: .question, title: "Ask a Question", description: "Any doubts? As the community"),
        .init(image: .poll, title: "Start a Poll", description: "Need the opinion of the many?"),
        .init(image: .event, title: "Organise an Event", description: "Start a meet with people to share your joys")
    ]
    
    
    @IBOutlet weak var fabOptionUITableView: UITableView!
    
    @IBOutlet weak var feedUIImageView: UIImageView!
    @IBOutlet weak var feedUILabel: UILabel!
    
    @IBOutlet weak var libraryUIImageView: UIImageView!
    @IBOutlet weak var libraryUILabel: UILabel!
    
    @IBOutlet weak var fabUIImage: UIImageView!
    
    @IBOutlet weak var messageUIImageView: UIImageView!
    @IBOutlet weak var messageUILabel: UILabel!
    
    @IBOutlet weak var serviceUIImageView: UIImageView!
    @IBOutlet weak var serviceUILabel: UILabel!
    
    @IBOutlet weak var tabContainerUIView: UIView!
    
    @IBOutlet weak var backdropUIView: UIView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fabOptionUITableView.register(UINib(nibName: "FabTableViewCell", bundle: nil), forCellReuseIdentifier: "FabTableViewCell")
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.bacdropClick(_:)))
        backdropUIView.addGestureRecognizer(gesture)
        DispatchQueue.main.async { [weak self] in
            self?.switchController(0)
        }
        self.selectTab(0)
    }
    
    
    
    @objc func bacdropClick(_ sender:UITapGestureRecognizer){
      toggleFab()
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeightConstraint.constant = self.fabOptionUITableView.contentSize.height
    }

    
    func animateMovement() {
        let animation = CASpringAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height + 48)
        animation.toValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height / 2)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        let jump = CASpringAnimation(keyPath: "transform.scale")
        jump.damping = 1500
        jump.mass = 10
        jump.initialVelocity = 10
        jump.stiffness = 1500.0
        
        jump.fromValue = 0
        jump.toValue = 1
        jump.isRemovedOnCompletion = false
        jump.duration = jump.settlingDuration + 1
        jump.fillMode = .forwards
        
        fabOptionUITableView.layer.add(jump, forKey: nil)
        fabOptionUITableView.layer.add(animation, forKey: nil)
    }
    
    func animateMovementReverse() {
        let animation = CASpringAnimation(keyPath: "position")
        animation.fromValue =  CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height / 2)
        animation.toValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height + 48)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        
        let jump = CASpringAnimation(keyPath: "transform.scale")
        jump.damping = 1500
        jump.mass = 10
        jump.initialVelocity = 10
        jump.stiffness = 1500.0
        
        jump.fromValue = 1
        jump.toValue = 0
        jump.isRemovedOnCompletion = false
        jump.duration = jump.settlingDuration + 1
        jump.fillMode = .forwards
        
        fabOptionUITableView.layer.add(jump, forKey: nil)
        fabOptionUITableView.layer.add(animation, forKey: nil)
    }
    

    @IBAction func onTabClick(_ sender: UIButton) {
        
        if sender.tag == selectedTab {
            return
        }
        
        if sender.tag == 2 {
            return
        }
        
        deselectTab(selectedTab)
        selectedTab = sender.tag
        selectTab(sender.tag)
        switchController(sender.tag)
    }
    
    
    @IBAction func fabClicked(_ sender: Any) {
        toggleFab()
    }
    
    
    private func toggleFab() {
        if backdropUIView.isHidden {
            fabOptionUITableView.isHidden = false
            animateMovement()
        } else {
            animateMovementReverse()
        }
        UIView.transition(with: backdropUIView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.backdropUIView.isHidden = !self.backdropUIView.isHidden
        })
        
        UIView.transition(with: fabUIImage, duration: 0.4, options: .curveEaseOut, animations: {
            self.fabUIImage.image = UIImage(name: self.backdropUIView.isHidden ? .fab: .close)
        })
    }
    
    
    private func deselectTab(_ tag: Int) {
        if tag == 0 {
            feedUILabel.textColor = UIColor.appColor(.gray)
            feedUIImageView.image = UIImage.init(name: .feed)
        } else if tag == 1 {
            libraryUILabel.textColor = UIColor.appColor(.gray)
            libraryUIImageView.image = UIImage.init(name: .library)
        } else if tag == 3 {
            messageUILabel.textColor = UIColor.appColor(.gray)
            messageUIImageView.image = UIImage.init(name: .messages)
        } else if tag == 4 {
            serviceUILabel.textColor = UIColor.appColor(.gray)
            serviceUIImageView.image = UIImage.init(name: .services)
        }
    }
    
    
    private func selectTab(_ tag: Int) {
        if tag == 0 {
            feedUILabel.textColor = UIColor.appColor(.green)
            feedUIImageView.image = UIImage.init(name: .feedSelected)
        } else if tag == 1 {
            libraryUILabel.textColor = UIColor.appColor(.green)
            libraryUIImageView.image = UIImage.init(name: .librarySelected)
        } else if tag == 3 {
            messageUILabel.textColor = UIColor.appColor(.green)
            messageUIImageView.image = UIImage.init(name: .messagesSelected)
        } else if tag == 4 {
            serviceUILabel.textColor = UIColor.appColor(.green)
            serviceUIImageView.image = UIImage.init(name: .servicesSelected)
        }
    }
    
    
    private func switchController(_ tag: Int) {
        
        for view in tabContainerUIView.subviews{
            view.removeFromSuperview()
        }

        let storyboard = UIStoryboard(name: "TabScreen", bundle: nil)
        
        if tag == 0 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDFeedViewController")
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 1 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDLibraryViewController")
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 3 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDMessageViewController")
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 4 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDServiceViewController")
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        }
    }
    
}


extension DDTabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fabData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = fabData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.identifier) as? DDTableViewCell
        cell?.populate(cellData)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}

extension DDTabViewController: UITableViewDelegate {
    
}

