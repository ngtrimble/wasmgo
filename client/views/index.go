package views

import (
	"fmt"
	"syscall/js"
)

var (
	buttonClicks int
)

func onButtonClick() {
	buttonClicks++
	fmt.Printf("button clicks %d\n", buttonClicks)
	js.Global().Get("document").Call("getElementById", "clicksBtn").Call("setAttribute", "value", buttonClicks)
}

func OnButtonClickWrapper() js.Func {
	onButtonClickFunc := js.FuncOf(
		func(this js.Value, args []js.Value) any {
			onButtonClick()
			return nil
		})
	return onButtonClickFunc
}
