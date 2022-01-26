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
        
        self.miPerfilposttableView.register(UINib(nibName: PostCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
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
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Andres Felipe Ocampo",
                                                           descripcionPerfil: "Senior llead iOS Engineer en NTTDATA, e instructior de iOS en CICE, Loremipsum,lo que sea que tiene que ser, Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran Lrem ipsum donde las leyes haces lo que quieran",
                                                           puestoActualperfil: "Sebioer Lead iOS Engineer",
                                                           usuarioLinkedInPerfil: "@andresocampo",
                                                           imagePerfil: "thor"))
            return cellPerfil
        default:
            let cellPost = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda",
                                                       descripcionPerfil: "Senior llead iOS Engineer en NTTDATA, e instructior de iOS en CICE, Senior llead iOS Engineer en NTTDATA, e instructior de iOS en CICE, Loremipsum,lo que sea que tiene que ser, Lrem ipsum ",
                                                       puestoActualperfil: "Sebioer Lead iOS Engineer",
                                                       usuarioLinkedInPerfil: "@Miranda_Lambert",
                                                       imagePerfil: "Miranda_Lambert"))
            return cellPost
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
            return UITableView.automaticDimension
        }
    }
}


extension ListaPerfilPostViewController: PerfilCellOutputDelegate {
    
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Explota la cebaxa", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertB2() {
        let alertVC = UIAlertController(title: "Explota la cebaxa", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Explota la cebaxa", message: withData?.nombrePerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
