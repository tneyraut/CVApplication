//
//  CompetencesInformatiquesTableViewController.swift
//  CVApplication
//
//  Created by Thomas Mac on 07/03/2016.
//  Copyright © 2016 ThomasNeyraut. All rights reserved.
//

import UIKit

class CompetencesInformatiquesTableViewController: UITableViewController {
    
    private let sections: NSArray = ["Langages de programmation maitrisés", "Compétences en conception de logiciels", "Frameworks et librairies"]
    
    private let elementsSection: NSArray = [["Développement d'applications mobiles iOS : Objective-c et Swift", "Java ; C", "Développement d'applications web mobiles (HTML5) : JS, HTML, CSS", "Développement web : PHP, HTML, JS, CSS, SQL"], ["Modélisation UML : Diagrammes UML, Design Pattern..."], ["Parse", "Mixpanel", "Xamarin"]]
    
    private let images: NSArray = [[NSLocalizedString("ICON_IOS", comment:""), NSLocalizedString("ICON_JAVA", comment:""), NSLocalizedString("ICON_HTML5", comment:""), NSLocalizedString("ICON_WEB", comment:"")], [NSLocalizedString("ICON_DEFAUT", comment:"")], [NSLocalizedString("ICON_PARSE", comment:""), NSLocalizedString("ICON_MIXPANEL", comment:""), NSLocalizedString("ICON_XAMARIN", comment:"")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.registerClass(SpecificTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
        self.title = "Compétences informatiques"
        
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
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section] as? String
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let array = self.elementsSection[indexPath.section]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.textLabel?.text = array[indexPath.row] as? String
        
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        cell.textLabel?.numberOfLines = 0
        
        let arrayImages = self.images[indexPath.section]
        
        cell.imageView?.image = UIImage(imageLiteral:arrayImages[indexPath.row] as! String);
        
        return cell
    }

}
