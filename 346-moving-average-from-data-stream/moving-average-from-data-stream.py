class MovingAverage:

    def __init__(self, size: int):
        self.sz = size
        self.dq = deque()

    def next(self, val: int) -> float:
        if len(self.dq) < self.sz:
            self.dq.append(val)
        else:
            self.dq.popleft()
            self.dq.append(val)
        
        return sum(self.dq)/len(self.dq)


        


# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage(size)
# param_1 = obj.next(val)