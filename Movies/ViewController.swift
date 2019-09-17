//
//  ViewController.swift
//  Movies
//
//  Created by zip520123 on 2019/9/12.
//  Copyright © 2019 zip520123. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


  let tableView = UITableView()
  let moviesListPresenter = { () -> MoviesListPresenter in
    let listModel = MoviesListModel(networkLayer: Network())

    let presenter = MoviesListPresenter(moviesListModel: listModel)

    return presenter
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupBinding()
    moviesListPresenter.fetchMovies()
  }

  func setupTableView() {

    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
    tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true


    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self)
  }

  func setupBinding() {
    moviesListPresenter.didFetchMovies = { [weak self] in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return moviesListPresenter.moviesCount()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//    let cell = tableView.dequeue(UITableViewCell.self, indexPath: indexPath)
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: String(describing: UITableViewCell.self))

    cell.textLabel?.text = moviesListPresenter.movieName(index: indexPath.row)

    cell.detailTextLabel?.text = moviesListPresenter.moviesRatting(index: indexPath.row)

    return cell
  }

}

extension UITableView {
  func register<T : UITableViewCell>(_ :T.Type) {
    let id = String(describing: T.self)
    register(T.self, forCellReuseIdentifier: id)
  }

  func dequeue<T: UITableViewCell>(_ : T.Type, indexPath: IndexPath) -> T {
    let id = String(describing: T.self)
    guard let cell = dequeueReusableCell(withIdentifier: id, for: indexPath) as? T else { return T.init() }
    return cell

  }

}
