class Solution:
    def findClosest(self, x: int, y: int, z: int) -> int:
        if (z-x<0):
            zx=x-z
        else:
            zx=z-x
        
        if (z-y<0):
            zy=y-z
        else:
            zy=z-y
        
        if(zx==zy):
            return 0
        
        ans=min(zx,zy)

        if ans==zx:
            return 1
        else:
            return 2
 