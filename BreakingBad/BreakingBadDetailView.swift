//
//  BreakingBadDetailView.swift
//  BreakingBad
//
//  Created by IACD-Air-7 on 2021/07/05.
//

import UIKit

class BreakingBadDetailView: UIViewController {
    
    @IBOutlet weak var breakImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    
    let breakingBadProvider = BreakingBadProvider()
    var breakingBadQuote: [QuoteDetail]?
    var breakBad: CharacterDetail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // getQuote()
        getDetail()
        
    }
    
    func getDetail() {
        nameLabel.text = "Name: \(breakBad?.name ?? "") "
        nicknameLabel.text = "Nickname:  \(breakBad?.nickname ?? "")"
        occupationLabel.text = "Occupation: \(breakBad?.occupation ?? [])"
        actorLabel.text = "Portrayed by : \(breakBad?.portrayed ?? "")"
        
        let status = breakBad?.status.rawValue ?? ""
        statusLabel.text = "Status:  \(breakBad?.status.rawValue ?? "")"
        if status == "Alive"{
            statusLabel.textColor = UIColor.green
        } else if status == "Unknown"{
            statusLabel.textColor = UIColor.yellow
        } else {
            statusLabel.textColor = UIColor.red
        }
        
        
        let url = URL(string: "\(breakBad?.img ?? "")")
        if let dataImage = try? Data(contentsOf: url!){
            breakImageView.image = UIImage(data: dataImage)
        }
        
        guard let quotes = breakingBadQuote else {
            return
        }
    
        var quoteString = ""
        
        for quote in quotes {
            quoteString.append("\n")
            quoteString.append("\(quote.quote)")
            
        }
        interestLabel.text = "Quote: \(quoteString )"
    }
 
}


// Do any additional setup after loading the view.





/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

