class Solution:
    def solveSudoku(self, board: List[List[str]]) -> None:

        rows,columns,boxes,empities=[],[],[],[]

        rows=[set() for r in range(9)]
        columns=[set() for c in range(9)]
        boxes=[set() for rc in range(9)]

        for r in range(9):
            for c in range(9):
                num = board[r][c]

                if num == '.':
                    empities.append((r,c))

                else:
                    rows[r].add(num)
                    columns[c].add(num)
                    boxes_index=(r//3)*3 + (c//3)
                    boxes[boxes_index].add(num)

        def trackback(index=0):
            if index == len(empities):
                return True

            r,c=empities[index]
            boxes_index=(r//3)*3+(c//3)

            for d in map(str,range(1,10)):
                if d not in rows[r] and d not in columns[c] and d not in boxes[boxes_index]:
                    board[r][c]=d
                    rows[r].add(d)
                    columns[c].add(d)
                    boxes[boxes_index].add(d)
                
                    if trackback(index+1):
                          return True
                
                # if all we make was false then we will need to undo it
                    board[r][c]='.'
                    rows[r].remove(d)
                    columns[c].remove(d)
                    boxes[boxes_index].remove(d)
                    
            return False 
        
        trackback()






        