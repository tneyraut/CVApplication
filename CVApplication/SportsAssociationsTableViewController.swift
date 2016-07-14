//
//  SportsAssociationsTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class SportsAssociationsTableViewController: UITableViewController {

    private let sections: NSArray = ["Aviron", "Athlétisme", "Association Informatique et Réseaux (AIR)"]
    
    private let elementsSection: NSArray = [["Participation au championnat de France d’aviron en 2009 dans la catégorie pair-oar cadet", "Participation a de multiples compétitions régionales (2008-2011)"], ["Participation au semi-marathon de Paris édition 2015 (1h27min55s)", "Participation au semi-marathon de Paris édition 2014 (1h30min48s)", "Participation à divers compétitions régionales d’athlétisme (2013-2015)"], ["Réalisation de l’application iOS l’Associatif pour la vie associative de l’école", "Responsable des cours de soutien", "Réalisation de dépannages informatiques et réseaux"]]
    
    private let images: NSArray = [[NSLocalizedString("ICON_AVIRON", comment:""), NSLocalizedString("ICON_AVIRON", comment:"")], [NSLocalizedString("ICON_ATHLETISME", comment:""), NSLocalizedString("ICON_ATHLETISME", comment:""), NSLocalizedString("ICON_ATHLETISME", comment:"")], [NSLocalizedString("ICON_AIR", comment:""), NSLocalizedString("ICON_AIR", comment:""), NSLocalizedString("ICON_AIR", comment:"")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Sports & Associations"
        
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
        return self.sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let array = self.elementsSection[section]
        
        return array.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let label = UILabel()
        label.text = self.sections[section] as? String
        label.textColor = UIColor.blackColor()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.backgroundColor = UIColor.lightTextColor()
        label.font = UIFont.boldSystemFontOfSize(16.0)
        
        label.sizeToFit()
        
        return label.frame.size.height + 10.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "    " + (self.sections[section] as! String)
        label.textColor = UIColor.blackColor()
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.backgroundColor = UIColor.lightTextColor()
        label.font = UIFont.boldSystemFontOfSize(16.0)
        
        label.sizeToFit()
        
        return label
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let array = self.elementsSection[indexPath.section] as! NSArray
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.textLabel?.text = array[indexPath.row] as? String
        
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        cell.textLabel?.numberOfLines = 0
        
        let arrayImages = self.images[indexPath.section] as! NSArray
        
        cell.imageView?.image = UIImage(imageLiteral:arrayImages[indexPath.row] as! String);
        
        cell.accessoryType = .None
        
        if (indexPath.row == 0 && indexPath.section == 2)
        {
            cell.accessoryType = .DetailButton
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let alertController = UIAlertController(title:"Informations", message:"Informations complémentaires", preferredStyle:.ActionSheet)
        
        let alertActionOne = UIAlertAction(title:"App Store", style:.Default) { (_) in UIApplication.sharedApplication().openURL(NSURL(string:"https://itunes.apple.com/us/app/mines-de-douai-lassociatif/id1023210848?mt=8")!) }
        
        let alertActionTwo = UIAlertAction(title:"GitHub", style:.Default) { (_) in UIApplication.sharedApplication().openURL(NSURL(string:"https://github.com/tneyraut/MinesDeDouaiAssociatif")!) }
        
        let alertActionThird = UIAlertAction(title:"Annuler", style:.Destructive) { (_) in }
        
        alertController.addAction(alertActionOne)
        alertController.addAction(alertActionTwo)
        alertController.addAction(alertActionThird)
        
        self.presentViewController(alertController, animated:true, completion:nil)
    }

}
