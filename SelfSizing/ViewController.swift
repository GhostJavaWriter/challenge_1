//
//  ViewController.swift
//  SelfSizing
//
//  Created by Bair Nadtsalov on 13.05.2023.
//

import UIKit

class ViewController: UITableViewController {

    private let reuseIdentifier = String(describing: CustomTableViewCell.self)
    
    private let users = [
        User(name: "Joe", message: "Hello World! I cannot wait to see what happens next. I do hope they all lived happily ever after. I cannot wait to see what happens next. I do hope they all lived happily ever after."),
        User(name: "Peter Piper", message: "Mr. Watson I presume"),
        User(name: "Harry Housefield", message: "Once upon a time, in a land far far away"),
        User(name: "Sir Roger Martin-Grayson III", message: "I cannot wait to see what happens next. I do hope they all lived happily ever after. I cannot wait to see what happens next. I do hope they all lived happily ever after.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messages"
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self)?.first as? HeaderView
        tableView.tableHeaderView = headerView
        
        configureHeader()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let headerView = tableView.tableHeaderView else {
                    return
                }
        let targetSize = CGSize(width: tableView.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let fittingSize = headerView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        if !headerView.bounds.size.equalTo(fittingSize) {
            headerView.frame.size = fittingSize
            tableView.tableHeaderView = headerView
        }
        
    }
    
    private func configureHeader() {
        guard let bookHeaderView = tableView.tableHeaderView as? HeaderView else {
            return
        }
        bookHeaderView.title.text = "sdfsdf"
        bookHeaderView.author.text = "dataSource?.author"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let profile = users[indexPath.row]
        cell.configureProfile(name: profile.name, message: profile.message)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

}

