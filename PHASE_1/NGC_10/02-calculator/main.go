package main

import (
	"fmt"
	"io"
	"os"

	"github.com/ucok-man/H8-NGC/PHASE_1/NGC_10/utils"
)

func main() {
	closeCpu := utils.CPUProfile("02-calculator/profile/cpu.pprof")
	defer closeCpu()

	logger, closefn := filelog("02-calculator/panic/log.log")
	defer closefn()
	defer utils.RecoverPanic(logger)

	if err := run(os.Stdin); err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}

	closeMem := utils.MEMProfile("02-calculator/profile/mem.pprof")
	defer closeMem()
}

func run(reader io.Reader) error {
	var calcApp Calculator

	// show menu
	fmt.Println(calcApp.Welcome())

	// prompt operation
	calcApp.operation = calcApp.promptOperation(reader)

	// prompt number
	calcApp.val_a = calcApp.promptNumber(reader, "input num 1: ")
	calcApp.val_b = calcApp.promptNumber(reader, "input num 2: ")

	// calculate
	result := calcApp.calculate(calcApp.operation, calcApp.val_a, calcApp.val_b)
	fmt.Println("RESULT:", result)

	return nil
}
