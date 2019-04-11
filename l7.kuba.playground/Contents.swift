import Cocoa
import Foundation

enum shotGonError: Error {
    
    case noBullets(bulletsneed: Int)
    case noFreeGun
    case noGun
    
}
struct Gun {
    
    var bullets: Int
    var gun: Int
}

class tirGuns {
    
    var inventory = [
        "AWP": Gun(bullets:10, gun:3),
        "Glock-18": Gun(bullets:20, gun:7),
        "AKM74": Gun(bullets:40, gun:17),
        "AK47": Gun(bullets: 30, gun: 10),
    ]
    var gunBullets = 0
    
    func errors(gunName name: String) throws {
    
        guard let guns = inventory[name] else {
        throw shotGonError.noGun
    }
        guard guns.gun > 0 else {
            throw shotGonError.noGun
        }
        
        guard guns.bullets <= gunBullets else {
            throw shotGonError.noBullets(bulletsneed: guns.bullets - gunBullets)
        }
        
        gunBullets -= guns.bullets
        
        var someGuns = guns
        someGuns.bullets -= 1
        inventory[name] = someGuns
        
        print("Взял оружие \(name)")
    }
}

let favoriteGun = [
    "igor": "AWP",
    "pavel": "Glock-18",
    "oleg": "AKM74"
]

func voteGuntier(person: String, Guns: tirGuns) throws {
    
    let playerName = favoriteGun[person] ?? "AK47"
    try Guns.errors(gunName: playerName)
}

var player = tirGuns()
player.gunBullets = 2


do {
    try voteGuntier(person: "igor", Guns: player)
} catch shotGonError.noFreeGun {
    print("Нет свободного оружия")
} catch shotGonError.noGun {
    print("В тире нет токого оружия")
} catch shotGonError.noBullets(let bulletsNeed) {
    print("Недостаточно патронов, нужно еще \(bulletsNeed)патронов.")
}
