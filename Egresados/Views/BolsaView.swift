//
//  BolsaView.swift
//  Egresados
//
//  Created by Israel Zavaleta on 04/11/22.
//

import SwiftUI

struct BolsaView: View {
    @StateObject var internet = Network()
    
    // Vacantes de LocalDB
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var vacantesLocalDB: FetchedResults<Vacantes>

    // Vacantes del servidor
    @State var vacantes: [VacantesData] = []
    
    
    var body: some View {
        Group{
            List(vacantes) { vacante in
                Text(vacante.sVacante ?? "")
            }.onAppear(){
                if internet.internetConnection {
                    getVacantesServer()
                }else{
                    getVacantesLocalDB()
                }
            }
        }
        
    }
    
    func getVacantesServer(){
        ServerConector.shared.GET_Vacantes { vacantesData in
            vacantes = vacantesData.data ?? []
        } requestFailure: { error in
            
        }
    }
    
    func saveNewVacantesInLocalDB(newVacantes: [VacantesData]){
        
        // Intertar aquí funcion para eliminar todos los datos actuales en Core Data
        
        for vacante in newVacantes{
            let vacanteLocalBD = Vacantes(context: managedObjectContext)
            vacanteLocalBD.nId = Int16(vacante.nId ?? 0)
            vacanteLocalBD.sVacante = vacante.sVacante ?? ""
            vacanteLocalBD.sFecha = vacante.sFecha ?? ""
            vacanteLocalBD.sLocalizacion = vacante.sLocalizacion ?? ""
            vacanteLocalBD.sTipoVacante = vacante.sTipoVacante ?? ""
            vacanteLocalBD.sUrlDetalle = vacante.sUrlDetalle ?? ""
            
            try? managedObjectContext.save()
        }
    }
    
    func getVacantesLocalDB(){
        vacantes.removeAll()
        
        for vacante in vacantesLocalDB {
            let vacantesData = VacantesData(nId: Int(vacante.nId), sVacante: vacante.sVacante ?? "", sFecha: vacante.sFecha ?? "", sLocalizacion: vacante.sLocalizacion ?? "", sNombreEmpresa: vacante.sNombreEmpresa ?? "", sSalario: vacante.sSalario ?? "", sTipoVacante: vacante.sTipoVacante ?? "", sUrlDetalle: vacante.sUrlDetalle ?? "")
            vacantes.insert(vacantesData, at: vacante.accessibilityElementCount())
        }
    }
}
