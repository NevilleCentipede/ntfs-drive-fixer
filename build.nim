import osproc
discard execProcess("nim", args=["c", "main.nim"], options={poUsePath, poStdErrToStdOut})
discard execProcess("./main", args=[], options={poUsePath, poStdErrToStdOut})
