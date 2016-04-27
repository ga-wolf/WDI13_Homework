/*You'll need these:

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
Examples

"cabbage" should be scored as worth 14 points:

3 points for C
1 point for A, twice
3 points for B, twice
2 points for G
1 point for E
And to total:

3 + 2*1 + 2*3 + 2 + 1
= 3 + 2 + 6 + 3
= 5 + 9
= 14*/

var scrabble={
  lettersScores: {
    'a':1
    'e':1
    'i':1
    'o':1
    'u':1
    'l':1
    'n':1
    'r':1
    's':1
    't':1
    'D':2
    'G':2
    'B':3
    'C':3
    'M':3
    'P':3
    'F':4
    'H':4
    'V':4
    'W':4
    'Y':4
    'k':4

  }
}
