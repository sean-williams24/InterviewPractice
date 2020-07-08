import UIKit

// Network requests

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

if let url = URL(string: "https://media.resources.festicket.com/www/artists/ArianaGrande.jpg") {
    let urlRequest = URLRequest(url: url)

    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error != nil else {
            print(error?.localizedDescription as Any)
            return
        }
        
        if let data = data {
            let image = UIImage(data: data)
            print(response)
        }
        
    }.resume()
} else {
    print("Invalid URL")
}

