package main

import (
	"net/http"
	"os"
)

const (
  portEnvName = "PORT"
  portDefault = "8030"
)

func main() {
  http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "text/plain")
    w.WriteHeader(http.StatusOK)
    w.Write([]byte("Hello world\n"))
  })

  http.ListenAndServe(":" + port(), nil)
}

func port() string {
  port := os.Getenv(portEnvName)
  if port == "" {
    port = portDefault
  }

  return port
}
