import UIKit

/* When someone searches their contacts based on a phone number, it's nice when a list of contacts pops up.

 Write an algorithm that searches you contacts for phone number strings and returns:
    - NO CONTACT i contact can't be found
    - A contact if a contact can be found.
    - The first alfabetized contact if there are multiple

 A: ["pim", "pom"]
 B: ["999999999", "777888999"]
 P: ["88999"]
 */

func findContact(_ a: [String], b: [String], p: String) -> String {
    guard a.count == b.count else {
        return "Error: Mismatching arrays"
    }

    var contacts: [String: String] = [:]

    for i in 0..<a.count {
        contacts[a[i]] = b[i]
    }

    let sortedContacts = contacts.sorted(by: { $0.key < $1.key })

    for contact in sortedContacts {
        if contact.value.contains(p) {
            return contact.key
        }
    }

    return "NO CONTACT"
}

findContact(["sander", "amy", "uann"], b: ["12345", "23456", "123"], p: "112")
