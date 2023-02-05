import Foundation

// The extension takes in anyfile (generics), and will crash the program if any information is loaded thats not on the model

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        
        // gets file and returns the type
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("[Fetch Error] Could not find: \(file)")
        }
        guard let data = try? Data(contentsOf: url ) else {
            fatalError("[Data Error] Could Not Load: \(file)")
        }
        
        // guard for decoding files
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("[Data Error] Could decode file: \(file)")
        }
        return loadedData
    }
}

struct User : Codable {
    var title, body : String
    var id : Int
    
    // init test for extension Bundle (decodable)
    static let allUsers : [User] = Bundle.main.decode(file: "Test.json")
    static let firstUser = allUsers[0]
}

