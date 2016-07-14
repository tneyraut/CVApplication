//
//  ProjetsInformatiquesTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class ProjetsInformatiquesTableViewController: UITableViewController {

    private let items: NSArray = ["GitHub : https://github.com/tneyraut", "Réalisation d’un système informatique de Televoting pour les Mines Douai (application iOS, application web mobile, site web et back-end web)", "Réalisation de l’application iOS l’Associatif pour la vie associative à l’école Mines Douai", "Réalisation d’applications iOS durant le temps libre", "Réalisation de programmes Java", "Réalisation du site internet sur le modèle du jeu de société Ticket To Ride", "Réalisation d’applications web mobiles"]
    
    private let images: NSArray = [NSLocalizedString("ICON_GITHUB", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_JAVA", comment:""), NSLocalizedString("ICON_WEB", comment:""), NSLocalizedString("ICON_HTML5", comment:"")]
    
    private let detailsItems: NSArray = [
        ["Televoting : Application iOS", "Televoting : Site web and back-end web", "Televoting : Application web mobile"],
        ["Apple Store", "GitHub"],
        ["Brain Fuck", "Dark Avenger", "The Maze", "CV application", "Crazy Bird", "Killy Bird", "Démineur", "Speaker", "Help Alarm", "Le Pendu", "Shoot", "Mac Triche", "Les Balls", "Dictée", "Web App"],
        ["Projet de Ré-ingénierie : JavaParser", "Projet de management des hommes"],
        ["Projet site web d'ISIC"],
        ["Televoting", "Projet d'ISIC"]
    ]
    
    private let detailsLinks: NSArray = [
        ["https://github.com/tneyraut/Televoting_Application_iOS", "https://github.com/tneyraut/Televoting_Site_Web", "https://github.com/tneyraut/Televoting_Application_Web_Mobile"],
        ["https://itunes.apple.com/us/app/mines-de-douai-lassociatif/id1023210848?mt=8", "https://github.com/tneyraut/MinesDeDouaiAssociatif"],
        ["https://github.com/tneyraut/BrainFuck", "https://github.com/tneyraut/DarkAvenger", "https://github.com/tneyraut/TheMaze", "https://github.com/tneyraut/CVApplication", "https://github.com/tneyraut/CrazyBird", "https://github.com/tneyraut/KillyBird", "https://github.com/tneyraut/Demineur", "https://github.com/tneyraut/Speaker", "https://github.com/tneyraut/HelpAlarm", "https://github.com/tneyraut/LePendu", "https://github.com/tneyraut/Shoot", "https://github.com/tneyraut/MacTriche","https://github.com/tneyraut/LesBalls", "https://github.com/tneyraut/Dictee", "https://github.com/tneyraut/WebApp"],
        ["https://github.com/tneyraut/JavaParser", "https://github.com/tneyraut/SeriousGame"],
        ["https://github.com/tneyraut/ProjetSiteWeb"],
        ["https://github.com/tneyraut/Televoting_Application_Web_Mobile", "https://github.com/tneyraut/ProjetApplicationWebMobile"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(TableViewCellWithTextView.classForCoder(), forCellReuseIdentifier:"cell")
        self.tableView.registerClass(TableViewCellWithTextView.classForCoder(), forCellReuseIdentifier:"cell1")
        
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
        if (indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! TableViewCellWithTextView
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell.imageView?.image = UIImage(imageLiteral:self.images[indexPath.row] as! String);
            
            cell.textView.text = self.items[indexPath.row] as! String
            
            cell.textView.dataDetectorTypes = UIDataDetectorTypes.Link
            
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCellWithTextView
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.imageView?.image = UIImage(imageLiteral:self.images[indexPath.row] as! String);
        
        cell.textView.text = self.items[indexPath.row] as! String
        
        cell.accessoryType = .DetailButton
        
        return cell
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        if (indexPath.row - 1 >= self.detailsItems.count || indexPath.row - 1 >= self.detailsLinks.count)
        {
            return
        }
        let alertController = UIAlertController(title:"Détails", message:"Lien GitHub des applications implémentées.", preferredStyle:.ActionSheet)
        
        let detailsArray = self.detailsItems[indexPath.row - 1] as! NSArray
        let linksArray = self.detailsLinks[indexPath.row - 1] as! NSArray
        var i = 0
        while (i < linksArray.count && i < detailsArray.count)
        {
            let url = linksArray[i] as! String
            let alertAction = UIAlertAction(title:detailsArray[i] as? String, style:.Default) { (_) in
                UIApplication.sharedApplication().openURL(NSURL(string:url)!);
            }
            alertController.addAction(alertAction)
            i += 1
        }
        let lastAlertAction = UIAlertAction(title:"Annuler", style:.Destructive) { (_) in }
        alertController.addAction(lastAlertAction)
        
        self.presentViewController(alertController, animated:true, completion:nil)
    }

}
