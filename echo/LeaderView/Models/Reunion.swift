//
//  Reunion.swift
//  echo
//
//  Created by Azuany Mila Cerón on 07/03/24.
//

import SwiftUI


struct Reunion: Identifiable {
    let id = UUID()
    let date: Date
    let topic: String
    let result: String
}

extension Reunion {
    
    static var test: Reunion {
        
        Reunion(
            date: Date.now,
            topic: "Más basureros en el parque",
            result: "Se acordaron poner 15 basureros más en zonas cercanas al Parque de las Siete Culturas.")
    }
    
    static var test2: Reunion {
        
        Reunion(
            date: Date.now,
            topic: "Juguetes por plantas",
            result: "Se establecieron los acuerdos para la campaña de juguetes por plantas.")
    }
    
    static var none: Reunion {
        Reunion(
            date: Date.now,
            topic: "No hay juntas",
            result: "...")
    }
    
}
