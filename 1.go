package main

import (
	"fmt"
	"os/exec"
	"sync"
)

func main() {
	waitch := make(chan bool, 50)
	printch := make(chan bool, 1)
	wg := sync.WaitGroup{}

	for i := 1000; i <= 9999; i++ {
		waitch <- true
		wg.Add(1)

		go func(i int) {
			cmd := exec.Command("./1.sh", fmt.Sprintf("%d", i))
			stdoutStderr, err := cmd.CombinedOutput()

			printch <- true
			fmt.Println("------------")
			fmt.Println(i)

			if err != nil {
				fmt.Println("err")
				fmt.Println(err)
				fmt.Println("------------")

				<-printch
				<-waitch
				wg.Done()

				return
			}

			fmt.Printf("%s\n", stdoutStderr)
			fmt.Println("------------")

			<-printch
			<-waitch
			wg.Done()
		}(i)
	}

	wg.Wait()
}
