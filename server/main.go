package main

import (
	"flag"
	"fmt"
	"net/http"
	"os"
)

var (
	serveDir string
)

func processArgs() {
	flag.StringVar(&serveDir, "servedir", "", "directory to serve")
	flag.Parse()

	if serveDir == "" {
		dir, err := os.Getwd()
		if err != nil {
			fmt.Printf("failed to get working directory, %f\n", err)
			os.Exit(1)
		}
		serveDir = dir
	}
}

func main() {
	processArgs()

	http.Handle("/", http.FileServer(http.FS(os.DirFS(serveDir))))

	fmt.Printf("Serving on http://127.0.0.1.:8008\n")
	http.ListenAndServe(":8080", nil)
}
