package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/ucok-man/H8-NGC/PHASE_1/NGC_10/utils"
)

func init() {
}

func main() {
	// runtime.SetCPUProfileRate(1000_000)
	closeCpu := utils.CPUProfile("01-anagram/profile/cpu.pprof")
	defer closeCpu()

	/* ---------------------------------------------------------------- */
	/*                             main code                            */
	/* ---------------------------------------------------------------- */
	logger, closefn := filelog("01-anagram/panic/log.log")
	defer closefn()
	defer utils.RecoverPanic(logger)

	if len(os.Args[1:]) != 2 {
		showhelp(os.Stderr)
		os.Exit(1)
	}

	if strings.ToLower(os.Args[1]) == "-help" {
		showhelp(os.Stderr)
		os.Exit(1)
	}

	if err := run(os.Args[1], os.Args[2]); err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}
	/* ------------------------- end main code ------------------------ */

	closeMem := utils.MEMProfile("01-anagram/profile/mem.pprof")
	defer closeMem()
}

func run(input_1, input_2 string) error {
	if err := validate(input_1, input_2); err != nil {
		return err
	}

	result := checkAnagram(input_1, input_2)
	fmt.Println(result)

	return nil
}
