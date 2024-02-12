import CryptoKit
import UIKit

// SHA-256
let string = "Hello Shamshad"
let data = Data(string.utf8)
let digest = SHA256.hash(data: data)
let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
print("Hash value is: \(hash)")


//AES
let aesString = "Hello Shamshad!".data(using: .utf8)!
let key = SymmetricKey(size: .bits256)
//encrypt
let sealedBox = try! AES.GCM.seal(aesString, using: key)

//decrypt
let decrypted = try? AES.GCM.open(sealedBox, using: key)
print("Decrypted String is: ",String(data: decrypted ?? Data(), encoding: .utf8) ?? "")

