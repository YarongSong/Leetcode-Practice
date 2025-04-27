class RecentCounter:

    def __init__(self):
        self.counter = 0
        self.res = []
        
    def ping(self, t: int) -> int:
        if len(self.res) == 0:
            self.counter += 1
            self.res.append(t)
            return self.counter
        
        self.res.append(t)
        self.counter += 1

        start = 0
        
        for i in range(len(self.res)):
            if self.res[i] < t - 3000:
                start += 1
                self.counter -= 1
            elif self.res[i] >= t - 3000:
                break
        
        self.res = self.res[i:]
        return self.counter
        





        


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)