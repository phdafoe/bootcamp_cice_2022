/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import MessageUI

// Output del Presenter
protocol MenuPresenterOutputProtocol {
    func reloadInformationInView()
}

class MenuViewController: BaseView<MenuPresenterInputProtocol> {

    // MARK: - IBOutlet
    
    @IBOutlet weak var menuTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromPresenter()
        self.configuracionTV()
    }
    
    private func configuracionTV() {
        self.menuTableview.delegate = self
        self.menuTableview.dataSource = self
        self.menuTableview.register(UINib(nibName: MenuCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: MenuCell.defaultReuseIdentifier)
    }

}

// Output del Presenter
extension MenuViewController: MenuPresenterOutputProtocol {

    func reloadInformationInView() {
        self.menuTableview.reloadData()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = self.menuTableview.dequeueReusableCell(withIdentifier: MenuCell.defaultReuseIdentifier, for: indexPath) as! MenuCell
        if let model = self.presenter?.informationForRow(indexPath: indexPath.row) {
            menuCell.setupCell(data: model)
        }
        return menuCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.presenter?.showWebSite()
        case 1:
            self.presenter?.showMusicViewController()
        case 2:
            self.presenter?.showCalendarViewController()
        case 3:
            self.presenter?.showTipsViewController()
        default:
            self.presenter?.sendMail(canSendMail: MFMailComposeViewController.canSendMail() ? true : false,
                                     delegate: self)
        }
    }
    

}

extension MenuViewController: MFMailComposeViewControllerDelegate {
    
}

