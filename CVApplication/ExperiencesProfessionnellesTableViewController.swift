//
//  ExperiencesProfessionnellesTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class ExperiencesProfessionnellesTableViewController: UITableViewController {

    private let sections: NSArray = ["Stage Ingénieur-Adjoint", "Stage technicien", "Projet de première année"]
    
    private let elementsSection: NSArray = [["Entreprise : Dekibae", "Fonction : Développeur iOS", "Mai - Août 2015 (4 mois)", "Tuteur : Florian Ponroy"], ["Entreprise : Bouygues Energies & Services", "Fonction : Conducteur de travaux partie électricité du système de climatisation et de désenfumage", "Chantier de construction du Ministère de la Défense, Paris Balard", "Mai - Août 2014 (4 mois)"], ["Fonction : Chef de projet", "Réalisation d’une étude de marché sur un système de vélos en libre-service", "Client : Mairie de la ville de Douai", "Tuteur : Jean-Etienne   Regniez"]]
    
    private let images: NSArray = [[NSLocalizedString("ICON_DEKIBAE", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_CALENDRIER", comment:""), NSLocalizedString("ICON_USER", comment:"")], [NSLocalizedString("ICON_BOUYGUES", comment:""), NSLocalizedString("ICON_CHANTIER", comment:""), NSLocalizedString("ICON_CHANTIER", comment:""), NSLocalizedString("ICON_CALENDRIER", comment:"")], [NSLocalizedString("ICON_USER", comment:""), NSLocalizedString("ICON_PROJET", comment:""), NSLocalizedString("ICON_DOUAI", comment:""), NSLocalizedString("ICON_USER", comment:"")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Expériences Professionnelles"
        
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
        
        if (indexPath.row == 3 && (indexPath.section == 0 || indexPath.section == 2))
        {
            cell.accessoryType = .DetailButton
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        var email = "florian@dekibae.com"
        var message = "Poste : CEO"
        if (indexPath.section == 2)
        {
            email = "jeregniez@ville-douai.fr"
            message = "Poste : Directeur adjoint du service voirie"
        }
        
        let alertController = UIAlertController(title:"Informations complémentaires", message:message, preferredStyle:.ActionSheet)
        
        let alertActionOne = UIAlertAction(title:email, style:.Default) { (_) in UIApplication.sharedApplication().openURL(NSURL(string:"mailto:\(email)")!) }
        let alertActionThird = UIAlertAction(title:"Annuler", style:.Destructive) { (_) in }
        
        alertController.addAction(alertActionOne)
        if (indexPath.section == 0)
        {
            let alertActionTwo = UIAlertAction(title:"Linkedin", style:.Default) { (_) in UIApplication.sharedApplication().openURL(NSURL(string:"https://www.linkedin.com/in/fponroy")!) }
            alertController.addAction(alertActionTwo)
        }
        alertController.addAction(alertActionThird)
        
        self.presentViewController(alertController, animated:true, completion:nil)
    }

}
