class ParkingSystem:

    def __init__(self, big: int, medium: int, small: int):
        self.big_slots = big
        self.mid_slots = medium
        self.sm_slots = small     
        

    def addCar(self, carType: int) -> bool:
        if carType == 1:
            if self.big_slots > 0:
                self.big_slots -= 1
                return True
            else:
                return False
        elif carType == 2:
            if self.mid_slots > 0:
                self.mid_slots -= 1
                return True
            else:
                return False
        elif carType == 3:
            if self.sm_slots > 0:
                self.sm_slots -= 1
                return True
            else:
                return False

        


# Your ParkingSystem object will be instantiated and called as such:
# obj = ParkingSystem(big, medium, small)
# param_1 = obj.addCar(carType)