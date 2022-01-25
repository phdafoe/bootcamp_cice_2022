//
//  ListaPerfilPostViewController.swift
//  MiAppIntroduccionTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/1/22.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {
    
    // MARK: - IBoutlets
    @IBOutlet weak var miPerfilposttableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }

    private func configuracionTableView() {
        self.miPerfilposttableView.delegate = self
        self.miPerfilposttableView.dataSource = self
        self.miPerfilposttableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }

}

extension ListaPerfilPostViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Andres Felipe Ocampo",
                                                           descripcionPerfil: "Senior llead iOS Engineer en NTTDATA, e instructior de iOS en CICE, Loremipsum,lo que sea que tiene que ser, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                           puestoActualperfil: "Sebioer Lead iOS Engineer",
                                                           usuarioLinkedInPerfil: "@andresocampo",
                                                           imagePerfil: "thor"))
            return cellPerfil
        default:
            return UITableViewCell()
        }
    }
    
}

extension ListaPerfilPostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 265
        default:
            return 265
        }
    }
    
}
