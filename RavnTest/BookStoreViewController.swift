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
    
    let viewModel = BookStoreViewModel()
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Book>>(configureCell: { (dataSource, table, idxPath, item) in
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: idxPath)
        cell.textLabel?.text = "\(item)"
        return cell
    })
    
    @IBOutlet weak var tableView: UITableView!
    
    // Book Observable
    var items : Observable<[Book]>!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getBooks()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}
