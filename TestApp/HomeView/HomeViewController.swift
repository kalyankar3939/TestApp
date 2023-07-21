//
//  HomeViewController.swift
//  TestApp
//
//  Created by Rohit Kalyankar on 20/07/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: class
{
    func didHomeReceiveListResponse(response: [Home.ViewModel]?, message: String, successCode: String, statusCode: Int)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    @IBOutlet weak var tblHomeView: UITableView!

    var homeArray : [Home.ViewModel]? = []
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    interactor?.getHomeList()
  }
}

///MARK : UITableView Delegate and DataSource Method
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeCell
        
        cell?.lblName.text = homeArray?[indexPath.row].name ?? ""
        cell?.lbmMessage.text = homeArray?[indexPath.row].home_message ?? ""
        return cell ?? UITableViewCell()
    }
    
}

///MARK : JSON API Extension
extension HomeViewController {
    func didHomeReceiveListResponse(response: [Home.ViewModel]?, message: String, successCode: String, statusCode: Int) {
        if successCode == "1" {
            if let data = response {
                print(message)
                 homeArray = data
                 print(homeArray)
                 tblHomeView.reloadData()
            }
        }
        else {
            self.showTopMessage(message: message, type: .Error)
        }
    }
}

///MARK : UITable View Cell
class HomeCell :UITableViewCell{
    
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lbmMessage: UILabel!
}