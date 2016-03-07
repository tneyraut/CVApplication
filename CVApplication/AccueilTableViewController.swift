//
//  AccueilTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class AccueilTableViewController: UITableViewController {

    private let itemsMenu: NSArray = ["Informations personnelles", "Formations", "Expériences professionnelles", "Projets informatiques", "Compétences informatiques", "Compétences linguistiques", "Sports & Associations"]
    
    private let imagesMenu: NSArray = [NSLocalizedString("ICON_INFORMATIONS", comment:""), NSLocalizedString("ICON_FORMATIONS", comment:""), NSLocalizedString("ICON_EXPERIENCES", comment:""), NSLocalizedString("ICON_PROJET", comment:""), NSLocalizedString("ICON_COMPETENCES_INFORMATIQUES", comment:""), NSLocalizedString("ICON_TOEIC", comment:""), NSLocalizedString("ICON_SPORT", comment:"")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "CV : Menu Principal"
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        cell.textLabel?.text = self.itemsMenu[indexPath.row] as? String
        
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        cell.textLabel?.numberOfLines = 0
        
        cell.imageView?.image = UIImage(imageLiteral:self.imagesMenu[indexPath.row] as! String);
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0)
        {
            let informationsPersonellesTableViewController = InformationsPersonnellesTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(informationsPersonellesTableViewController, animated:true)
        }
        else if (indexPath.row == 1)
        {
            let formationsTableViewController = FormationsTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(formationsTableViewController, animated:true)
        }
        else if (indexPath.row == 2)
        {
            let experiencesProfessionnellesTableViewController = ExperiencesProfessionnellesTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(experiencesProfessionnellesTableViewController, animated:true)
        }
        else if (indexPath.row == 3)
        {
            let projetInformatiquesTableViewController = ProjetsInformatiquesTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(projetInformatiquesTableViewController, animated:true)
        }
        else if (indexPath.row == 4)
        {
            let competencesInformatiquesTableViewController = CompetencesInformatiquesTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(competencesInformatiquesTableViewController, animated:true)
        }
        else if (indexPath.row == 5)
        {
            let competencesLinguistiquesTableViewController = CompetencesLinguistiquesTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(competencesLinguistiquesTableViewController, animated:true)
        }
        else if (indexPath.row == 6)
        {
            let sportsAssociationsTableViewController = SportsAssociationsTableViewController(style: UITableViewStyle.Plain)
            
            self.navigationController?.pushViewController(sportsAssociationsTableViewController, animated:true)
        }
    }

}
