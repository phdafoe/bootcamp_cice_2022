//
//  ListaTareasViewController.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    // MARK: - Variables globales
    var datasourceTareas: [DownloadNewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaTareasTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal { results in
            if let resultsUnw = results{
                self.datasourceTareas = resultsUnw.downloads ?? []
                self.listaTareasTableView.reloadData()
            }
        } failure: { error in
            debugPrint(error?.debugDescription ?? "AQUI ANDRES METE-GAMBA")
        }
    }
    
    private func configuracionTV() {
        self.listaTareasTableView.delegate = self
        self.listaTareasTableView.dataSource = self
        self.listaTareasTableView.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }

}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.datasourceTareas.count == 0{
            let imageBackground = UIImageView(image: #imageLiteral(resourceName: "img_empty_list"))
            imageBackground.contentMode = .scaleAspectFit
            self.listaTareasTableView.backgroundView = imageBackground
        }else{
            self.listaTareasTableView.backgroundView = UIView()
        }
        return self.datasourceTareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listaTareasTableView.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cell.nombreCategoriaLBL.text = self.datasourceTareas[indexPath.row].newTask
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
