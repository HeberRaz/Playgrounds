import UIKit

enum NetworkError: Error {
    case badeUrl
    case decodingError
    case invalidId
}

struct CreditScore: Decodable {
    let score: Int
}

struct Constant {
    struct Url {
        static func equifax(userId: Int) -> URL? {
            return URL(string: "https://ember-sparkly-rule.glitch.me/equifax/credit-score/\(userId)")
        }

        static func experian(userId: Int) -> URL? {
            return URL(string: "https://ember-sparkly-rule.glitch.me/equifax/credit-score/\(userId)")
        }
    }
}

func calculateAPR(creditScores: [CreditScore]) -> Double {
    let sum = creditScores.reduce(0) { next, credit in
        return next + credit.score
    }
    // Calculate the APR based on the scores
    return Double(sum/creditScores.count)
}

func getAPR(userId: Int) async throws -> Double {
    if userId % 2 == 0 {
        throw NetworkError.invalidId
    }

    guard let equifaxUrl = Constant.Url.equifax(userId: userId),
          let experianUrl = Constant.Url.experian(userId: userId) else {
        throw NetworkError.badeUrl
    }

    async let (equifaxData, _) = URLSession.shared.data(from: equifaxUrl)
    async let (experianData, _) = URLSession.shared.data(from: experianUrl)

    // custom code

    let equifaxCreditScore = try? JSONDecoder().decode(CreditScore.self, from: try await equifaxData)
    let experianCreditScore = try? JSONDecoder().decode(CreditScore.self, from: try await experianData)

    guard let equifaxCreditScore,
          let experianCreditScore else {
        throw NetworkError.decodingError
    }
    return calculateAPR(creditScores: [equifaxCreditScore, experianCreditScore])
}

Task {
    let apr = try await getAPR(userId: 1)
    print(apr)
}
// Using Task.checkCancellation() we allow the process to continue even if some calls fail. This can be done by virtue of do try catch block

let ids = [1,2,3,4,5]
var invalidIds = [Int]()
//
//Task {
//    for id in ids {
//        do {
//            try Task.checkCancellation()
//            let apr = try await getAPR(userId: id)
//            print(apr)
//        } catch {
//            print("Error", error)
//            invalidIds.append(id)
//        }
//    }
//}

func getAPRForAllUsers(ids: [Int]) async throws -> [Int: Double] {
    var userAPR: [Int: Double] = [:]

    try await withThrowingTaskGroup(of: (Int, Double).self) { group in
        for id in ids {
            group.async {
                let apr = try await getAPR(userId: id)
                return (id, try await getAPR(userId: id))
            }
        }

        for try await (id, apr) in group {
            userAPR[id] = apr
        }
    }
    return userAPR
}

Task {
    let userAPRs = try await getAPRForAllUsers(ids: ids)
    print(userAPRs)
}
