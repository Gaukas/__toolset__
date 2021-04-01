package strkit

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strings"

	randutil "github.com/Gaukas/randutil_kai"
)

// Generate a random n-length string
func RandSeq(n int) string {
	val, err := randutil.GenerateCryptoRandomString(n, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
	if err != nil {
		panic(err)
	}

	return val
}

// Parse interface to JSON or panic if error
func ToJSON(obj interface{}) string {
	b, err := json.Marshal(obj)
	if err != nil {
		panic(err)
	}
	return string(b)
}

// Parse JSON to interface or panic if error
func FromJSON(in string, obj interface{}) {
	err := json.Unmarshal([]byte(in), obj)
	if err != nil {
		panic(err)
	}
}

// Read STDIN until newline
func MustReadStdin() string {
	r := bufio.NewReader(os.Stdin)

	var in string
	for {
		var err error
		in, err = r.ReadString('\n')
		if err != io.EOF {
			if err != nil {
				panic(err)
			}
		}
		in = strings.TrimSpace(in)
		if len(in) > 0 {
			break
		}
	}

	fmt.Println("")

	return in
}
