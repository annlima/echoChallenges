//
//  LeaderStatistics.swift
//  echo
//
//  Created by Azuany Mila Cerón on 06/03/24.
//

import SwiftUI
import Charts


struct CommunityStatistics: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

struct StackedCommunityStatistics: Identifiable {
    var type: String
    var count: Double
    var month: String
    var id = UUID()
}

struct LeaderStatistics: View {
    
    var data: [CommunityStatistics] = [
        .init(type: "Denuncias", count: 15),
        .init(type: "Juntas", count: 4),
        .init(type: "Acciones", count: 7),
    ]
    
    var data2: [StackedCommunityStatistics] = [
        .init(type: "Denuncias", count: 5, month: "Enero"),
        .init(type: "Juntas", count: 4, month: "Enero"),
        .init(type: "Acciones", count: 6, month: "Enero"),
        .init(type: "Denuncias", count: 8, month: "Febrero"),
        .init(type: "Juntas", count: 3, month: "Febrero"),
        .init(type: "Acciones", count: 1, month: "Febrero"),
        .init(type: "Denuncias", count: 15, month: "Marzo"),
        .init(type: "Juntas", count: 4, month: "Marzo"),
        .init(type: "Acciones", count: 7, month: "Marzo"),
    ]
    
    var body: some View {
        
        ScrollView{
            ZStack(alignment: .top) {
                
                VStack(alignment: .center, spacing: 15){
                    
                    Text("Estadísticas de mi comunidad")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                    
                    Divider()
                    
                    Text("Este mes")
                        .font(.headline)
                    
                    Chart {
                        BarMark(
                            x: .value("Tipo", data[0].type),
                            y: .value("Cantidadt", data[0].count)
                        )
                        BarMark(
                            x: .value("Tipo", data[1].type),
                            y: .value("Cantidadt", data[1].count)
                        )
                        BarMark(
                            x: .value("Tipo", data[2].type),
                            y: .value("Cantidad", data[2].count)
                        )
                    }
                    .padding()
                    .foregroundStyle(.colorPrincipal)
                    .frame(minHeight: 200)
                    .chartXAxis {AxisMarks(values: .automatic) {
                        AxisValueLabel()
                            .font(.headline)
                    }
                    }
                    
                    Text("Últimos 6 meses")
                        .font(.headline)
                    
                    Chart(data2) { item in
                        BarMark(
                            x: .value("Mes", item.month),
                            y: .value("Cantidad", item.count)
                        )
                        .foregroundStyle(by: .value("Tipo", item.type))
                    }
                    .padding()
                    .frame(minHeight: 300)
                    .chartXAxis {AxisMarks(values: .automatic) {
                        AxisValueLabel()
                            .font(.headline)
                        
                        
                    }
                    }
                }
                .padding()
                
                
            }
        }
    }
}

#Preview {
    LeaderStatistics()
}
