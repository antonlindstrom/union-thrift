package main

import (
	"bytes"
	"fmt"
	"github.com/antonlindstrom/union-thrift/vendor/thrift/example"

	"git.apache.org/thrift.git/lib/go/thrift"
)

func main() {
	z := example.Z{
		Y: &example.Y{A: int8(1)},
	}

	var b []byte
	buffer := bytes.NewBuffer(b)

	trans := thrift.NewStreamTransportW(buffer)
	proto := thrift.NewTBinaryProtocolTransport(trans)

	err := z.Write(proto)
	trans.Flush()

	if err != nil {
		fmt.Printf("Error: %s\n", err)
	}

	fmt.Printf("Written: %#v\n", buffer.Bytes())
}
