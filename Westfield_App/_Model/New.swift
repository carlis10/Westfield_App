import Foundation
import SwiftUI

class New: ObservableObject, Identifiable{
    
    let id = UUID()
    
    public var _title:String = ""
    public var _description:String = ""
    public var _image: Image? = nil
    init(title:String,description:String,image:Image?){
        _title = title
        _description = description
        _image = image
    }
}
