import Alamofire

class CountryListService {

    private let clientID = "dd6696c38b5148059ad9dedb408d6c84"
    private let clientSecret = "56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ"

    func getCountryList(callback: @escaping (Result <ListResource, AFError>) -> Void) {
        guard let url = URL(string: "https://sync.bankin.com/v2/banks?limit=100") else { return }
        
        let headers: HTTPHeaders = [
            "Bankin-Version": "2018-06-15",
            "Client-Id": clientID,
            "Client-Secret": clientSecret
        ]

        AF.request(url, method: .get, headers: headers).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(ListResource.self, from: data)
                callback(.success(jsonData))
                } catch {
                    if let error = response.error {
                        callback(.failure(error))
                    }
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
