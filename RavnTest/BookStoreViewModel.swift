//
//  DatasourceViewController.swift
//  RavnTest
//
//  Created by Daniel Siancas on 4/30/18.
//  Copyright © 2018 Daniel Siancas. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class BookStoreViewModel {

    func getBooks() -> Observable<[SectionModel<String, Book>]> {
        return Observable.create { (observer) -> Disposable in
            
            let books = [Book(title: "Introduction to Algorithms", author: "Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest y Clifford Stein", price: 100),
                         Book(title: "A Game of Thrones", author: "George R. R. Martin", price: 30),
                         Book(title: "The Adventures of Sherlock Holmes", author: "Arthur Conan Doyle", price: 7)]
            let section = [SectionModel(model: "", items: books)]
            observer.onNext(section)
            observer.onCompleted()

            return Disposables.create()
        }
    }
    
}
