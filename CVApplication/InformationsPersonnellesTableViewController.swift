//
//  InformationsPersonnellesTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class InformationsPersonnellesTableViewController: UITableViewController {

    private let itemsMenu: NSArray = ["Thomas Neyraut", "Né le 27/12/1993 à Nice, 22 ans", "Nationalité fançaise", "+33 (0)6 77 35 88 68", "+1 (438) 496-9969", "Permis B", "6 rue Saint Léonard La Varenne Saint Hilaire 94210, France", "3300 avenue Troie Montréal H3V 1A9, Canada", "thomas.neyraut@minesdedouai.fr", "thomas.neyraut@polymtl.ca", "GitHub : https://github.com/tneyraut", "Linkedin : https://www.linkedin.com/in/thomas-neyraut-3a5b00a6"]
    
    private let imagesMenu: NSArray = [NSLocalizedString("ICON_USER", comment:""), NSLocalizedString("ICON_CALENDRIER", comment:""), NSLocalizedString("ICON_FRANCE", comment:""), NSLocalizedString("ICON_TELEPHONE", comment:""), NSLocalizedString("ICON_TELEPHONE", comment:""), NSLocalizedString("ICON_PERMI", comment:""), NSLocalizedString("ICON_ADRESSE", comment:""), NSLocalizedString("ICON_ADRESSE", comment:""), NSLocalizedString("ICON_EMAIL", comment:""), NSLocalizedString("ICON_EMAIL", comment:""), NSLocalizedString("ICON_GITHUB", comment:""), NSLocalizedString("ICON_LINKEDIN", comment:"")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        self.tableView.registerClass(TableViewCellWithTextView.classForCoder(), forCellReuseIdentifier:"cellWithTextView")
        //self.tableView.registerClass(PhotoTableViewCell.classForCoder(), forCellReuseIdentifier:"cellPhotoProfil")
        
        self.title = "Informations personnelles"
        
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
        return self.itemsMenu.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row > 2 && indexPath.row != 5)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellWithTextView", forIndexPath: indexPath) as! TableViewCellWithTextView
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell.imageView?.image = UIImage(imageLiteral:self.imagesMenu[indexPath.row] as! String);
            
            cell.textView.text = self.itemsMenu[indexPath.row] as! String
            
            if (indexPath.row == 3 || indexPath.row == 4)
            {
                cell.textView.dataDetectorTypes = UIDataDetectorTypes.PhoneNumber
            }
            else if (indexPath.row == 6 || indexPath.row == 7)
            {
                cell.textView.dataDetectorTypes = UIDataDetectorTypes.Address
            }
            else if (indexPath.row >= 8)
            {
                cell.textView.dataDetectorTypes = UIDataDetectorTypes.Link
            }
            return cell
        }
        
        /*if (indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellPhotoProfil", forIndexPath: indexPath)
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell.imageView?.image = UIImage(imageLiteral:self.imagesMenu[indexPath.row] as! String);
            
            cell.textLabel?.text = self.itemsMenu[indexPath.row] as? String
            
            cell.textLabel?.textAlignment = .Center
            
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            cell.textLabel?.numberOfLines = 0
            
            return cell
        }*/
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.imageView?.image = UIImage(imageLiteral:self.imagesMenu[indexPath.row] as! String);
        
        cell.textLabel?.text = self.itemsMenu[indexPath.row] as? String
        
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }

}
