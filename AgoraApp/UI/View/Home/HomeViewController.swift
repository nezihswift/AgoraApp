//
//  HomeViewController.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit
import Combine

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStackView: UIStackView!
    
    private let tableCellIdentifier = "HomeTableCell"
    private let cellHeight: CGFloat = 60
    
    let viewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: tableCellIdentifier, bundle: nil), forCellReuseIdentifier: tableCellIdentifier)
        setTitle(text: viewModel.getUsername())
        setNavigationButtons()
        setListeners()
    }
    
    private func setNavigationButtons() {
        if let icon = UIImage(systemName: "rectangle.portrait.and.arrow.right")?.withTintColor(.RedColor(), renderingMode: .alwaysOriginal) {
            addButton(to: .right, selector: #selector(logoutButtonAction), icon: icon, target: self)
        }
        
        if let icon = UIImage(systemName: "plus")?.withTintColor(.TitleColor(), renderingMode: .alwaysOriginal) {
            addButton(to: .right, selector: #selector(addChannelAction), icon: icon, target: self)
        }
    }
    
    @objc private func addChannelAction() {
        let storyboard = UIStoryboard(name: "AddChannelView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddChannelView") as? AddChannelViewController {
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("Error: Unable to instantiate AddChannelViewController")
        }
    }
    
    @objc private func logoutButtonAction() {
        let alert = UIAlertController(title: "Çıkış Yap", message: "Çıkış yapmak istediğinize emin misiniz?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "Çıkış Yap", style: .destructive) { _ in
            UsernameManager.shared.deleteUsername()
            NavigationManager.shared.openLogin()
        }
        
        alert.addAction(logoutAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func setListeners() {
        viewModel.$channels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] channels in
                guard let self else {
                    return
                }
                emptyStackView.isHidden = !(channels.count == 0)
                tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier) as? HomeTableCell,
              let channel = viewModel.getChannel(at: indexPath.row) else {
            return UITableViewCell()
        }
        cell.configure(with: channel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let channel = viewModel.getChannel(at: indexPath.row) else {
            return
        }
        
        let storyboard = UIStoryboard(name: "ChannelView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ChannelView") as? ChannelViewController {
            vc.viewModel.setChannelName(name: channel.channelName)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("Error: Unable to instantiate ChannelViewController")
        }
    }
}
