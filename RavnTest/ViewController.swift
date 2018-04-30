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

struct Book {
    let title : String
}

class SimpleTableViewExampleViewController : UIViewController {
    
    let bookArray = [
        Book(title: "title1"),
        Book(title: "title2"),
        Book(title: "title3"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    // Book Observable
    var items : Observable<[Book]>!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        items = Observable.just(bookArray)
        bindData()
        
        
        tableView.rx.modelSelected(Book.self).subscribe(onNext: {
            book in
            print(book.title)
        }).disposed(by: disposeBag)
        
    }
    
    private func bindData() {
        tableView.dataSource = nil
        items.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (row, book, cell) in
            if let cellToUse = cell as? TableViewCell {
                cellToUse.book = book
            }
            }.disposed(by: disposeBag)
    }
    
}
