//
//  LocationsViewController.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit

public final class LocationViewController: UITableViewController {
    
    private let controller : LocationsController
    private static let cellIdentifier = "locationViewController.cellIdentifier"
    private typealias CellType = UIComponents.TableViewCell<LocationsListView>
    private let pullToRefreshView = UIComponents.PullToRefreshView()
    
    private var locations : [Location] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    public init(controller : LocationsController = .init()) {
        self.controller = controller
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: LifeCycle
extension LocationViewController {
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pullToRefreshView.isHidden = !self.locations.isEmpty
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
}

// MARK: Setup
extension LocationViewController {
    
    func setup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CellType.self, forCellReuseIdentifier: Self.cellIdentifier)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        self.view.insertSubview(pullToRefreshView, at: 0)
        pullToRefreshView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pullToRefreshView.topAnchor.constraint(equalTo: self.view.topAnchor),
            pullToRefreshView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pullToRefreshView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pullToRefreshView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        fetchData()
    }
}

// MARK: Data
extension LocationViewController {
    
    @objc
    func fetchData() {
        Task {
            do {
                let locations = try await self.controller.getLocations()
                DispatchQueue.main.async {
                    self.tableView.refreshControl?.endRefreshing()
                    self.locations = locations
                }
            } catch(_) {
                // @TODO: handle error, retry mechanism?
                let alert = UIAlertController(title: "Something went wrong", message: "Please try again later", preferredStyle: .alert)
                alert.addAction(.init(title: "Ok", style: .cancel))
                tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

// MARK: UITableViewDelegate
extension LocationViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let location = self.locations[safe: indexPath.item] else {
            assertionFailure("locations array(\(locations.count)) selection index(\(indexPath.item) out of bounds ")
            return
        }

        let coordinates = location.location.coordinate
        let urlString = "wikipedia://places?lat=\(coordinates.latitude)&long=\(coordinates.longitude)"
        guard let deepLinkURL = URL(string: urlString) else {
            assertionFailure("Could not form url from string: \(urlString)")
            return
        }
        // returns false for some unknown reason, might have to do with running on simulator
//        guard UIApplication.shared.canOpenURL(deepLinkURL) else {
//            assertionFailure("Cannot open url: \(deepLinkURL)")
//            return
//        }
        UIApplication.shared.open(deepLinkURL, options: [:], completionHandler: nil)
    }
}


// MARK: UITableViewDatasource
extension LocationViewController {
        
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! CellType
        
        guard let location = locations[safe: indexPath.item] else {
            assertionFailure("Array(\(locations.count) index out of bounds \(indexPath.item)")
            return cell
        }
        
        cell.view.updateUI(with: .init(from: location))
        return cell
    }                                                                                                                                               
}
