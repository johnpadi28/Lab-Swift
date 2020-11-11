import UIKit
import PlaygroundSupport

var str = "Hello, playground"

PlaygroundPage.current.needsIndefiniteExecution = true

//https://icanhazdadjoke.com/j/<joke_id>

struct RepresentativeResult: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let district: String
    let officeAddress: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case party
        case district
        case officeAddress = "office"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.party = try values.decode(String.self, forKey: CodingKeys.party)
        self.district = try values.decode(String.self, forKey: CodingKeys.district)
        self.officeAddress = try values.decode(String.self, forKey: CodingKeys.officeAddress)
    }
}




func getData() {
    guard let url = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=84043&output=json") else { return }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        if let data = data,
           let results = try? decoder.decode(RepresentativeResult.self, from: data),
            let rep = results.results as? [Representative] {
                print(rep[0])
            }
        }
    task.resume()
}


getData()



