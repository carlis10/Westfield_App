
import Foundation
import SwiftUI

class Items: ObservableObject, Identifiable{
    
    let id = UUID()
    
    @Published var _name:String = ""
    @Published var _image:Image? = nil
    @Published var _dateUnlocked:Int? = nil
    @Published var _description:String = ""
    init(name:String,image:Image?,dateUnlocked:Int?,description:String){
        _name = name
        _image = image
        _dateUnlocked = dateUnlocked
        _description = description
    }
}
