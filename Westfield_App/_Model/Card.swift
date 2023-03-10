
import Foundation
import SwiftUI

class Card: ObservableObject, Identifiable{
    
    
    
    let id = UUID()
    
    @Published var _tipo: tipeCard? = nil
    @Published var _valor: valorCard? = nil
    @Published var _front: Image? = nil
    init(tipo:tipeCard?,valor:valorCard?,front:Image?){
        _tipo = tipo
        _valor = valor
        _front = front
    }
    func SelecionarImg() -> String{
        var imgText = ""
        if _valor == valorCard.A{
            imgText += "A"
        }
        else if _valor == valorCard.t10{
            imgText += "10"
        }
        else if _valor == valorCard.t9{
            imgText += "9"
        }
        else if _valor == valorCard.t8{
            imgText += "8"
        }
        else if _valor == valorCard.t7{
            imgText += "7"
        }
        else if _valor == valorCard.t6{
            imgText += "6"
        }
        else if _valor == valorCard.t5{
            imgText += "5"
        }
        else if _valor == valorCard.t4{
            imgText += "4"
        }
        else if _valor == valorCard.t3{
            imgText += "3"
        }
        else if _valor == valorCard.t2{
            imgText += "2"
        }
        else if _valor == valorCard.Q{
            imgText += "Q"
        }
        else if _valor == valorCard.K{
            imgText += "K"
        }
        else if _valor == valorCard.J{
            imgText += "J"
        }
        imgText += "-"
        if _tipo == tipeCard.corazon{
            imgText += "Hearts"
        }
        else if _tipo == tipeCard.trevol{
            imgText += "Clover"
        }
        else if _tipo == tipeCard.pica{
            imgText += "Spades"
        }
        else if _tipo == tipeCard.diamante{
            imgText += "Diamonds"
        }
        return imgText
    }
    func CalcValor() -> Int{
        var valor: Int = 0
        if _valor == valorCard.t10{
            valor += 10
        }
        else if _valor == valorCard.t9{
            valor += 9
        }
        else if _valor == valorCard.t8{
            valor += 8
        }
        else if _valor == valorCard.t7{
            valor += 7
        }
        else if _valor == valorCard.t6{
            valor += 6
        }
        else if _valor == valorCard.t5{
            valor += 5
        }
        else if _valor == valorCard.t4{
            valor += 4
        }
        else if _valor == valorCard.t3{
            valor += 3
        }
        else if _valor == valorCard.t2{
            valor += 2
        }
        else if _valor == valorCard.Q{
            valor += 10
        }
        else if _valor == valorCard.K{
            valor += 10
        }
        else if _valor == valorCard.J{
            valor += 10
        }
        return valor
    }
    
}
enum tipeCard{
    case corazon
    case diamante
    case pica
    case trevol
}

enum valorCard{
    case A
    case t2
    case t3
    case t4
    case t5
    case t6
    case t7
    case t8
    case t9
    case t10
    case J
    case Q
    case K
}
extension tipeCard: CaseIterable {
    static var allCases: [tipeCard] {
        return [.trevol, .pica, .diamante, .corazon]
    }
}
extension valorCard: CaseIterable {
    static var allCases: [valorCard] {
        return [.A,.J,.K,.Q,.t2,.t3,.t4,.t5,.t6,.t7,.t8,.t9,.t10]
    }
}


