var nums = [1,2,3,4,5,6,7,8,9,10]
var fives = []
this.nums.forEach((v) => {
    if (v % 5 === 0)
        this.fives.push(v)
})
assert(fives.toString() === "5,10")