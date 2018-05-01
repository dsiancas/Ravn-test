//
//  ViewController.swift
//  RavnTest
//
//  Created by Daniel Siancas on 4/30/18.
//  Copyright © 2018 Daniel Siancas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class BookStoreViewController : UIViewController {
    
    // ViewModel
    let viewModel = BookStoreViewModel()
    
    // Adding a Book Datasource and configurating it´s cell
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Book>>(configureCell: { (dataSource, table, idxPath, item) in
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: idxPath)
        cell.textLabel?.text = "\(item.title) written by \(item.author) has a price of $ \(item.price).00"
        cell.textLabel?.numberOfLines = 0
        return cell
    })
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Binding the datasource to the tableview
        viewModel.getBooks()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}
