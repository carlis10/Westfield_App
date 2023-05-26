//
//  CreateNewView.swift
//  Westfield_App
//
//  Created by Apps2M on 6/3/23.
//

import SwiftUI

struct CreateNewView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State var titleNew: String = ""
    @State var bodyNew: String = ""
    @Environment(\.dismiss) var dismiss
    
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
    var body: some View {
        
        ZStack{
            Color.init(hex: "111111")
                .edgesIgnoringSafeArea(.all)
            Color.init(hex: "F3F0E9")
            VStack{
                Image(uiImage: self.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                Text("Change photo")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .padding()
                    .onTapGesture {
                        showSheet = true
                    }
                ZStack{
                    Image("fondo3")
                        .resizable()
                        .scaledToFit()
                    TextField(text: $titleNew){}
                        .foregroundColor(Color.init(hex: "EEEEEE"))
                        .font(.custom("CowboyMovie", size: 40))
                        .padding()
                }.padding()
                TextEditor(text: $bodyNew)
                    .foregroundColor(Color.init(hex: "111111"))
                    .background(Color.init(hex: "111111"))
                    .padding()
                
            }.navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(){
                    
                    ToolbarItem(placement:.navigationBarLeading){
                        Button(action: {dismiss()}){
                            Image("Return")
                                .resizable()
                                .frame(width: 80, height: 30)
                        }
                    }
                    ToolbarItem(placement:.navigationBarTrailing){
                        Button(action:{
                            DataManager.NewsList.append(New(title: titleNew, description: bodyNew, image: Image(uiImage: image)))
                            /*Confirmar*/
                            dismiss()
                        }){
                            Image("Confirm")
                                .resizable()
                                .frame(width: 80, height: 30)
                                .foregroundColor(Color.white)
                        }
                    }
                }
        }
        
        
        .sheet(isPresented: $showSheet) {
            // Pick an image from the photo library:
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            
            //  If you wish to take a photo from camera instead:
            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
    }
}

struct CreateNewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewView()
    }
}
