//
//  NewsArticleView.swift
//  StocksApp
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(10)
                    .gesture(DragGesture()
                                .onChanged(self.onDragBegin)
                                .onEnded(self.onDragEnd)
                    )
                
                Text("From News")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(10)
                
                ScrollView{
                    VStack{
                        ForEach(self.newsArticles, id: \.title) {
                            article in
                            
                            HStack(){
                                VStack(alignment: .leading){
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                URLImage(URL(string: article.imageURL)!, content: {
                                    $0.resizable()
                                }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }.padding(10)
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", imageURL: "https://picsum.photos/1600/900", publication: "Yigit News")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)], onDragBegin: {_ in}, onDragEnd: {_ in})
    }
}
