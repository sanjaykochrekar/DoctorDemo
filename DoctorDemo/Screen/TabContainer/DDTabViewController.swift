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
    
    @IBOutlet weak var fabOptionUITableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewWillLayoutSubviews()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeightConstraint.constant = self.fabOptionUITableView.contentSize.height
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
    
    
    @objc func bacdropClick(_ sender:UITapGestureRecognizer){
      toggleFab()
    }
    
    
    private func initialSetUp() {
        DispatchQueue.main.async { [weak self] in
            self?.switchController(0)
        }
        self.selectTab(0)
        
        fabOptionUITableView.register(UINib(nibName: "FabTableViewCell", bundle: nil), forCellReuseIdentifier: "FabTableViewCell")
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.bacdropClick(_:)))
        backdropUIView.addGestureRecognizer(gesture)
    }

    
    private func animateMovement() {
        let positionAnimation = CASpringAnimation(keyPath: "position")
        positionAnimation.fromValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height + 48)
        positionAnimation.toValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height / 2)
        positionAnimation.duration = 2
        positionAnimation.fillMode = .forwards
        positionAnimation.isRemovedOnCompletion = false
        positionAnimation.beginTime = CACurrentMediaTime()
        
        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.damping = 1500
        scaleAnimation.mass = 10
        scaleAnimation.initialVelocity = 1
        scaleAnimation.stiffness = 1500.0
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.duration = scaleAnimation.settlingDuration + 1
        scaleAnimation.fillMode = .forwards
        
        fabOptionUITableView.layer.add(scaleAnimation, forKey: nil)
        fabOptionUITableView.layer.add(positionAnimation, forKey: nil)
    }
    
    
    private func animateMovementReverse() {
        let positionAnimation = CASpringAnimation(keyPath: "position")
        positionAnimation.fromValue =  CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height / 2)
        positionAnimation.toValue = CGPoint(x: fabOptionUITableView.layer.frame.origin.x + fabOptionUITableView.frame.width / 2, y: fabOptionUITableView.layer.frame.origin.y + fabOptionUITableView.frame.height + 48)
        positionAnimation.duration = 0
        positionAnimation.fillMode = .forwards
        positionAnimation.delegate = self
        positionAnimation.isRemovedOnCompletion = false
        positionAnimation.beginTime = CACurrentMediaTime()
        
        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.damping = 1500
        scaleAnimation.mass = 10
        scaleAnimation.initialVelocity = 10
        scaleAnimation.stiffness = 1500.0
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.duration = scaleAnimation.settlingDuration + 1
        scaleAnimation.fillMode = .forwards
        scaleAnimation.delegate = self
        fabOptionUITableView.layer.add(scaleAnimation, forKey: nil)
        fabOptionUITableView.layer.add(positionAnimation, forKey: nil)
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
        
        UIView.transition(with: fabUIImage, duration: 0.4, options: .curveEaseInOut, animations: {
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
            addChild(vc)
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 1 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDLibraryViewController")
            addChild(vc)
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 3 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDMessageViewController")
            addChild(vc)
            tabContainerUIView.addSubview(vc.view)
            vc.view.frame = tabContainerUIView.bounds
            vc.didMove(toParent: self)
            
        } else if tag == 4 {
            
            let vc = storyboard.instantiateViewController(identifier: "DDServiceViewController")
            addChild(vc)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.identifier) as? DDListViewCell
        cell?.populate(cellData,indexPath: nil)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
}

extension DDTabViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        toggleFab()
        handleFabAction(indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    
    private func handleFabAction(_ indexPath: IndexPath) {
        let data = fabData[indexPath.row]
        let alert = UIAlertController(title: data.title, message: data.description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension DDTabViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag && backdropUIView.isHidden {
            fabOptionUITableView.isHidden = true
        }
    }
}
