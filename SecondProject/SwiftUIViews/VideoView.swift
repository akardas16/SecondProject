//
//  VideoView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 25.04.2022.
//

import SwiftUI

struct VideoView: View {
    var list = VideoList.topTen
    var body: some View {
      
        
        NavigationView{
            List(list,id: \.id){ video in
                NavigationLink {
                    VideoDetailView(video: video)
                } label: {
                    HStack{
                        Image(video.imageName).resizable().scaledToFit().frame(height:70).cornerRadius(10).padding(.vertical,4)
                        VStack(alignment:.leading, spacing:5){
                            Text(video.title).fontWeight(.semibold).bold().lineLimit(2).minimumScaleFactor(0.5)
                            Text(video.uploadDate).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }

             
            }.listStyle(PlainListStyle()).navigationTitle("Videos")
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
            .preferredColorScheme(.dark)
            
    }
}
