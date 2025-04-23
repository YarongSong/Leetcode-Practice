class RecentCounter:

    def __init__(self):
        self.time = []
        self.counter = 0
        
        

    def ping(self, t: int) -> int:
        self.time.append(t)
        self.counter = 0
        for tt in self.time:
            if tt >= t - 3000:
                self.counter += 1
        
        return self.counter



        


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)