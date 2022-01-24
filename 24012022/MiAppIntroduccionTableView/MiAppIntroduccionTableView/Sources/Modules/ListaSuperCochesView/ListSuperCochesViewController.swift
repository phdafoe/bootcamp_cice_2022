//
//  ListSuperCochesViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/1/22.
//

import UIKit

class ListSuperCochesViewController: UIViewController {
    
    // MARK: - Variables globales
    var dataSourceCoches: [CochesModel] = []
    var imageCoche = UIImage(named: "audi")
    
    // MARK: - IBOutlet
    @IBOutlet weak var miLIstaCochesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configuracionUI()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Metodos privados
    private func configuracionUI() {
        self.title = Utils.Constants().tituloListaCoches
        for item in 0..<23 {
            let modelData = CochesModel(nombre: "Audi",
                                        color: "Verde",
                                        imagen: imageCoche)
            dataSourceCoches.append(modelData)
            print("\(dataSourceCoches[item])")
        }
    }
    
    private func configuracionTableView() {
        self.miLIstaCochesTableView.delegate = self
        self.miLIstaCochesTableView.dataSource = self
    }
}

extension ListSuperCochesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceCoches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ListSuperCochesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
