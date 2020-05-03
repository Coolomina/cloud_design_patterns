package main

import (
	"fmt"
	"github.com/go-resty/resty/v2"
	//"net/http"
	"os"
	"time"

)

func main()  {

	client := resty.New()
	client.SetRetryCount(4)
	client.SetTimeout(5* time.Second)
  // Commented for demo proposes it works perfectly
	//client.AddRetryCondition(
	//func(r *resty.Response, err error) bool {
	//	return r.StatusCode() == http.StatusTooManyRequests
	//	},
	//)

	apiUrl := "http://nginx"
	if url := os.Getenv("URL"); url != "" {
		apiUrl = url
	}

	var resp, err = client.R().Get(apiUrl)
	if err != nil {
		fmt.Printf("Quota exceeded")
	}

	fmt.Printf("Status code:%v,\n\n Body: %s ",resp.Status(), string(resp.Body()))
}
