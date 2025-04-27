class RecentCounter:

    def __init__(self):
        self.res = deque()
        

    def ping(self, t: int) -> int:
        self.res.append(t)
        i = 0
        while i < len(self.res):
            if self.res[i] < t - 3000:
                self.res.popleft()
                i = 0
            else:
                break

        
        return len(self.res)
        


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)