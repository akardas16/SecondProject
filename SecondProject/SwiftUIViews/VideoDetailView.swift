//
//  VideoDetailView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 25.04.2022.
//

import SwiftUI

struct VideoDetailView: View {
    var video:Video
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing:16){
            Spacer()
            Spacer()
            Image(video.imageName).resizable().scaledToFit().frame(height:160).cornerRadius(16)
            
            Text(video.title).foregroundColor(.primary).font(.title2).bold().multilineTextAlignment(.center).padding(.horizontal,16)
            
            HStack{
                Spacer()
                Spacer()
                Label("\(video.viewCount)", systemImage: "eye.fill").foregroundColor(.gray)
                Spacer()
                Text(video.uploadDate).foregroundColor(.gray)
                Spacer()
                Spacer()
            }
            
            Text(video.description).foregroundColor(.primary).font(.subheadline).padding(.vertical,16).padding(.horizontal,4)
            
            Spacer()
            Button {
                openURL(video.url)
            } label: {
                Text("Watch Now").foregroundColor(.white).bold().background(Capsule(style: .continuous).fill(.red).padding(.horizontal,45).frame(width: UIScreen.main.bounds.width, height: 50))
            }.buttonStyle(MyButtonStyle())
            Spacer()
            Spacer()

        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen[2])
            .preferredColorScheme(.dark)
    }
}
