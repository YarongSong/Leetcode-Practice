class RecentCounter:

    def __init__(self):
        self.time = []
        self.counter = 0
        
        

    def ping(self, t: int) -> int:
        self.time.append(t)
        while self.time[self.counter] < t - 3000:
            self.counter += 1
        
        return len(self.time) - 1 - self.counter + 1



        


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)