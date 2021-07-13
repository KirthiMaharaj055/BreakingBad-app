//
//  BBListViewConroller.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/06/29.
// json data uitableViewController in uikits

import UIKit

class BBListViewConroller: UITableViewController {
    
    let breakingBadProvider = BreakingBadProvider()
    var breakBad = [CharacterDetail]() {
        didSet {
            DispatchQueue.main.async { [self] in
                self.tableView.reloadData()
                self.navigationItem.title = "Breaking Bad"
            }
        }
    }

    var breakingBadQuote = [QuoteDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        getQuote()
        breakingBadLoadData()
       
        tableView.dataSource = self
       tableView.delegate = self
      // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    fileprivate func breakingBadLoadData() {
        breakingBadProvider.fetchBreakingBadAPI { [weak self] characters in
            switch characters {
                case .success(let character):
                   // print(character)
                    self?.breakBad = character
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    fileprivate func getQuote() {
         breakingBadProvider.fetchBreakBadQuotesApi { [weak self] result in
             switch result {
                 case .success(let quote):
                     print(quote)
                    DispatchQueue.main.async {
                      self?.breakingBadQuote = quote
                     
                    }
                 case .failure(let error):
                     print(error)
             }
         }
     }
   
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return breakBad?.count ?? 0
        return breakBad.count
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreakingBadListCell", for: indexPath) as! BreakingBadListCell
        // Configure the cell...
        let character = breakBad[indexPath.row]
      //  let quote = breakingBadQuote[indexPath.row]
         
        let url = URL(string: "\(character.img)")
        if let dataImage = try? Data(contentsOf: url!){
            cell.imageViews.image = UIImage(data: dataImage)
        }
        cell.nameSurnameLabel?.text = character.name
        cell.nicknameLabel?.text = character.nickname
        cell.birthdayLabel?.text = character.birthday.rawValue
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SendDataSegue", sender: self)
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BreakingBadDetailView {
            destination.breakBad = breakBad[(tableView.indexPathForSelectedRow?.row)!]
            
            //destination.interestLabel.text = breakingBadQuote[(IndexPath.row)].quote
           destination.breakingBadQuote = breakingBadQuote
        }
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

/*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let breakB = breakBad[fromIndexPath.row]
        breakBad.remove(at: fromIndexPath.row)
        breakBad.insert(breakB, at: to.row)
       tableView.reloadData()
    }
*/

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
