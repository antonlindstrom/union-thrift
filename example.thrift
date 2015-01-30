namespace go example

struct X {
  1: required byte a
	2: optional byte b
}

struct Y {
  1: required byte a
}

union Z {
  1: X x
  2: Y y
}
