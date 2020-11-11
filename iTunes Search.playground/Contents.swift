import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map{URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    let artist: String
    let name: String
    let genre: String
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case name = "trackName"
        case genre = "primaryGenreName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.genre = try values.decode(String.self, forKey: CodingKeys.genre)
        
    }
}

func fetchItems(matching query: [String: String], completion:
   @escaping ([StoreItem]?) -> Void) {

    let baseURL = URL(string:
       "https://itunes.apple.com/search?")!

    guard let url = baseURL.withQueries(query) else {
        completion(nil)
        print("Unable to build URL with supplied queries.")
        return
    }
    print(url)

    let task = URLSession.shared.dataTask(with: url) { (data,
       response, error) in
        let decoder = JSONDecoder()
        if let data = data,
            let storeItems = try?
               decoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("Either no data was returned, or data was not serialized.")

            completion(nil)
            return
        }
    }

    task.resume()
}

let query: [String: String] = ["term": "eminem", "media": "musicVideo", "limit": "5"]

fetchItems(matching: query) { (items) in
    if let items = items {
        print(items)
    }
}


