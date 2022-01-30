import SwiftUI

extension Color {
    static let app1 = Color(red: 35/255, green: 40/255, blue: 48/255)
    static let app2 = Color(red: 27/255, green: 31/255, blue: 40/255)
    static let app3 = Color.black
}

struct BookImageView: View {
    var user: User
    var work: Work
    
    var body: some View {
        ZStack {
            let uiImage: UIImage =  (UIImage(named: work.imageName) ?? UIImage(named: "default-cover"))!
            
            if user.getReadStatus(work: work) == ReadStatus.read {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .border(Color.green)
            }
            else {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
//                    .border(Color.red)
            }
            VStack {
                HStack {
                    Spacer()
                    
//
                }
                Spacer()
            }
        }
    }
}

struct BookInfoView: View {
    var user: User
    var work: Work
    let fontSize = 12.0
    
    var body: some View {
        HStack {
        VStack(alignment: .leading, spacing: 0) {
            Text(work.title)
                .foregroundColor(ColorManager.mainForeground)
                .font(.headline)
                .lineLimit(2)
                .truncationMode(.tail)
                .allowsTightening(true)
                .padding(.bottom, 2)
            Group {
            Text(work.getAuthorText())
                .foregroundColor(ColorManager.mainForeground)
                .font(.caption)
                .lineLimit(1)
                .truncationMode(.tail)
                .allowsTightening(true)
            Text(work.getAwardText())
                .foregroundColor(ColorManager.mainForeground)
                .font(.caption)
                .lineLimit(1)
                .truncationMode(.tail)
                .allowsTightening(true)
            
            if let series = work.series {
                if let seriesOrdinalName = work.seriesOrdinalName {
                    Text(series.name + ", " + seriesOrdinalName)
                        .foregroundColor(ColorManager.mainForeground)
                        .font(.caption)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .allowsTightening(true)
                }
                else {
                    Text(series.name)
                        .foregroundColor(ColorManager.mainForeground)
                        .font(.caption)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .allowsTightening(true)
                }
            }
            else {
                Text("")
                    .foregroundColor(ColorManager.mainForeground)
                    .font(.caption)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .allowsTightening(true)
            }
            
            Text("")
                .foregroundColor(ColorManager.mainForeground)
                .font(.caption)
                .lineLimit(1)
                .truncationMode(.tail)
                .allowsTightening(true)
            Spacer(minLength: 0)
            HStack {
                let read = user.getReadStatus(work: work) == ReadStatus.read
                let wantToRead = user.getReadStatus(work: work) == ReadStatus.wantToRead
                let currentlyReading = user.getReadStatus(work: work) == ReadStatus.currentlyReading
                let owned = user.getOwnStatus(work: work) == OwnStatus.owned
                let wantToOwn = user.getOwnStatus(work: work) == OwnStatus.wantToOwn
                
                let fadedColor = Color.white.opacity(0.3)
                Image(systemName: read ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(read ? .green : fadedColor)
                    .font(.system(size: 16))
                Spacer()
                Image(systemName: wantToRead ? "bookmark.fill" : "bookmark")
                    .foregroundColor(wantToRead ? .pink : fadedColor)
                    .font(.system(size: 16))
                Spacer()
                Image(systemName: currentlyReading ? "eyeglasses" : "eyeglasses")
                    .foregroundColor(currentlyReading ? .blue : fadedColor)
                    .font(.system(size: 16))
                Spacer()
                Image(systemName: owned ? "book.closed.fill" : "book.closed")
                    .foregroundColor(owned ? .yellow : fadedColor)
                    .font(.system(size: 16))
//                Image(systemName: "checkmark.circle")
//                    .foregroundColor(.green)
//                    .background(Color.white.mask(Circle()))
//                    .font(.system(size: 20))
//                    .padding(.top, 6)
//                    .padding(.leading, 12)
//                    .padding(.trailing, 12)
//                    .padding(.bottom, 0)
            }
            .padding(.bottom, 5)
            }
            .opacity(0.6)
        }
            Spacer(minLength: 0)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        let padding: CGFloat = 3
        let user = store.db.user.getCurrentUser()
        
        TabView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                          spacing: padding) {
                    ForEach(store.db.work.getHugoWinnersOnly(), id: \.self) { work in
                        let read = user.getReadStatus(work: work) == ReadStatus.read
                        VStack {
                            BookImageView(user: user, work: work)
                            BookInfoView(user: user, work: work)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.app1, lineWidth: read ? 2 : 0, antialiased: true)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.app1)
                                        .overlay(Color.green.opacity(read ? 0.0 : 0).cornerRadius(20))
                                )

                        )
                        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 0)
                        .padding(5)
                    }
                }
                .padding(.horizontal, 10)
            }
            .background(Color.app2.ignoresSafeArea())
            .tabItem {
                Image(systemName: "books.vertical")
            }
            
            Text("User Stats")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }
            
            VStack {
                Text(store.db.user.getCurrentUser().getName())
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                Text(store.db.user.getCurrentUser().getEmail())
                    .font(.system(size: 24, weight: .regular, design: .rounded))
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
            }
        }
    }
}
