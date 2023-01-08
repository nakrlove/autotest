//
//  ViewController.swift
//  autotest
//
//  Created by nakrlove on 2023/01/03.
//

import UIKit

class MyTableVC: UIViewController {

    @IBOutlet weak var myTableview: UITableView!
    let contentsArray = ["is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                         
        " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged." ,
        
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." ,
        
        "Where does it come from?" ,
        
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source" ,
        
        "Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of ",
        
        "de Finibus Bonorum et Malorum" ,
        
        "(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance." ,
        "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested" ,
        
        "Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham",
        
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
        
        "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
        
        "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy." ,
        
        "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        
        
                         
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myTableViewCellNib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        self.myTableview.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        self.myTableview.rowHeight = UITableView.automaticDimension
        self.myTableview.estimatedRowHeight = 120
        
        self.myTableview.delegate = self
        self.myTableview.dataSource = self
        
        
    }


}

extension MyTableVC : UITableViewDelegate {
    
}

extension MyTableVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableview.dequeueReusableCell(withIdentifier: "myTableViewCell" , for: indexPath) as! TableViewCell
        cell.userContentLabel.text = contentsArray[indexPath.row]
        
        return cell
    }
    
    
}
