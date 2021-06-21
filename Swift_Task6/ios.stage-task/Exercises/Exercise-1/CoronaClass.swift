import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var freeSeats = [Int]()

     init(n: Int) {
        for item in 0..<n {
            freeSeats.append(item)
        }
     }
     
     func seat() -> Int {
        if seats.isEmpty {
            seats.append(freeSeats.first!)
            freeSeats[0] = -1
            return seats.first!
        }
        
        var seatNumber = 0
        var maxDistance = 0
        for seat in stride(from: freeSeats.count - 1, through: 0, by: -1) {
            let tmpDistance = min(maxLeftDistance(n: seat), maxRightDistance(n: seat))
            if  tmpDistance >= maxDistance {
                seatNumber = freeSeats[seat]
                maxDistance = tmpDistance
            }
        }
        seats.append(seatNumber)
        seats.sort()
        freeSeats[seatNumber] = -1

        return seatNumber
     }
     
     func leave(_ p: Int) {
        freeSeats[p] = p
        seats = seats.filter(){ $0 != p }
     }
    
    func maxLeftDistance(n: Int) -> Int {
        var distance = 0
        if n == 0 { return 100 }
        for index in stride(from: n, through: 0, by: -1) {
            if freeSeats[index] == n - distance {
                distance += 1
            }
        }
        return distance
    }
    
    func maxRightDistance(n: Int) -> Int {
        var distance = 0
        if n == freeSeats.count - 1 { return 100 }
        for index in stride(from: n, through: freeSeats.count - 1, by: 1) {
            if freeSeats[index] == n + distance {
                distance += 1
            }
        }
        return distance
    }
}
