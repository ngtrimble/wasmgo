package main

import (
	"fmt"
	"syscall/js"

	"wasmgo/client/views"
)

func main() {
	fmt.Println("Hello from gowasm")
	js.Global().Set("onButtonClickWrapper", views.OnButtonClickWrapper())
	<-make(chan bool)
}
