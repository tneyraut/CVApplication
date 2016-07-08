//
//  FormationsTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class FormationsTableViewController: UITableViewController {

    private let sections: NSArray = ["Polytechnique Montréal (2015-2017)", "Mines Douai (2013-2017)", "MOOC (2013-2014)", "Lycée Marcelin Berthelot (2010-2013)"]
    
    private let elementsSection: NSArray = [["Master en génie informatique option logiciel"], ["Ingénieur généraliste", " Spécialisation : Ingénierie des Systèmes d'Information et de Communication (ISIC)"], ["Ecole Centrale Lille", "Certificat en gestion de projet"], ["Etudiant en CPGE MPSI-PSIE", "Bac scientifique avec mention bien"]]
    
    private let images: NSArray = [[NSLocalizedString("ICON_POLYTECHNIQUE", comment:"")], [NSLocalizedString("ICON_MINES_DOUAI", comment:""), NSLocalizedString("ICON_MINES_DOUAI", comment:"")], [NSLocalizedString("ICON_DEFAUT", comment:""), NSLocalizedString("ICON_DEFAUT", comment:"")], [NSLocalizedString("ICON_DEFAUT", comment:""), NSLocalizedString("ICON_DEFAUT", comment:"")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Formations"
        
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
        
        return cell
    }

}
