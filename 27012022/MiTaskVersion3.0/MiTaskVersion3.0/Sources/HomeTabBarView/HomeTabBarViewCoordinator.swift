//
//  HomeTabBarViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/1/22.
//

import UIKit

final class HomeTabBarViewCoordinator {
    
    static func homeViewController() -> UITabBarController {
        let homeVC = HomeTabBarViewController()
        
        // Controladores
        let contactosVC = ContactosViewCordinator.navigation()
        let nuevaTareaVC = NuevaTareaViewCoordinator.navigation()
        let listaTareasVC = ListaTareasViewCoordinator.navigation()
        
        // iconos
        let iconContacto = UITabBarItem(title: "Mis Contactos",
                                        image: UIImage(systemName: "person.crop.circle"),
                                        selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        let iconNuevaTarea = UITabBarItem(title: "Nueva Tarea",
                                          image: UIImage(systemName: "pencil.and.outline"),
                                          selectedImage: UIImage(systemName: "pencil.and.outline"))
        
        let iconListaTarea = UITabBarItem(title: "Mis Tareas",
                                          image: UIImage(systemName: "text.redaction"),
                                          selectedImage: UIImage(systemName: "text.redaction"))
        // asignamos icono -> Controladores
        contactosVC.tabBarItem = iconContacto
        nuevaTareaVC.tabBarItem = iconNuevaTarea
        listaTareasVC.tabBarItem = iconListaTarea
        
        
        // asignamos Controladores al TabBar
        homeVC.viewControllers = [contactosVC, nuevaTareaVC, listaTareasVC]
        
        return homeVC
    }
    
}
