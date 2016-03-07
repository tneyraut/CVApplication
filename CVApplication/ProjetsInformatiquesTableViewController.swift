//
//  ProjetsInformatiquesTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class ProjetsInformatiquesTableViewController: UITableViewController {

    private let items: NSArray = ["GitHub : https://github.com/tneyraut", "Réalisation d’un système informatique de Televoting pour les Mines Douai (application iOS, application web mobile, site web et back-end web)", "Réalisation de l’application iOS l’Associatif pour la vie associative à l’école Mines Douai", "Réalisation du site internet sur le modèle du jeu de société Ticket To Ride", "Réalisation d’applications iOS durant le temps libre", "Réalisation de programmes Java durant le temps libre", "Réalisation d’applications web mobiles"]
    
    private let images: NSArray = [NSLocalizedString("ICON_GITHUB", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_WEB", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_JAVA", comment:""), NSLocalizedString("ICON_HTML5", comment:"")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Projets informatiques"
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        shadow.shadowOffset = CGSizeMake(0, 1)
        
        let buttonPrevious = UIBarButtonItem(title:"Retour", style:UIBarButtonItemStyle.Done, target:nil, action:nil)
        buttonPrevious.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red:245.0/255.0, green:245.0/255.0, blue:245.0/255.0, alpha:1.0), NSShadowAttributeName: shadow, NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size:21.0)!], forState:UIControlState.Normal)
        
        self.navigationItem.backBarButtonItem = buttonPrevious

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.imageView?.image = UIImage(imageLiteral:self.images[indexPath.row] as! String);
        
        let textView = UITextView(frame:CGRectMake(self.view.frame.size.width / 3, 5.0, 2 * self.view.frame.size.width / 3, cell.frame.size.height - 10.0))
        textView.textColor = UIColor.blackColor()
        textView.editable = false
        textView.textAlignment = NSTextAlignment.Left
        textView.font = UIFont(name:(cell.textLabel?.font?.fontName)!, size:15.0);
        textView.text = self.items[indexPath.row] as! String
        
        if (indexPath.row == 0)
        {
            textView.dataDetectorTypes = UIDataDetectorTypes.Link
        }
        
        cell.addSubview(textView)
        
        return cell
    }

}
