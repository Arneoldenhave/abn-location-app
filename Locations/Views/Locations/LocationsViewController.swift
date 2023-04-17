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
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CellType.self, forCellReuseIdentifier: Self.cellIdentifier)
        Task {
            do {
                let locations = try await self.controller.getLocations()
                DispatchQueue.main.async {
                    self.locations = locations
                }
            } catch(let error) {
                // @TODO: handle error
            }
        }
    }
}

// UITableViewDelegate
extension LocationViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
}


// UITableViewDatasource
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

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
