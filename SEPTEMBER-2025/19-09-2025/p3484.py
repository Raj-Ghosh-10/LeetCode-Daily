class Spreadsheet:

    def __init__(self, rows: int):
        self.rows = rows
        self.cols = 26
        self.grid = [[0] * self.cols for _ in range(rows)]

    def setCell(self, cell: str, value: int) -> None:
        col_char, row_str = cell[0], cell[1:]
        col = ord(col_char) - ord('A')
        row = int(row_str) - 1
        if 0 <= row < self.rows and 0 <= col < self.cols:
            self.grid[row][col] = value

    def resetCell(self, cell: str) -> None:
        col_char, row_str = cell[0], cell[1:]
        col = ord(col_char) - ord('A')
        row = int(row_str) - 1
        if 0 <= row < self.rows and 0 <= col < self.cols:
            self.grid[row][col] = 0

    def getValue(self, formula: str) -> int:
        # Formula is of the form "=X+Y"
        parts = formula[1:].split('+')
        if len(parts) != 2:
            return 0  # Invalid formula, but according to constraints it should be valid.
        
        def parse_value(s):
            if s[0].isalpha():
                # It's a cell reference
                col_char = s[0]
                row_str = s[1:]
                col = ord(col_char) - ord('A')
                row = int(row_str) - 1
                if 0 <= row < self.rows and 0 <= col < self.cols:
                    return self.grid[row][col]
                else:
                    return 0
            else:
                return int(s)
        
        x = parse_value(parts[0])
        y = parse_value(parts[1])
        return x + y