package utils

import (
	"log"
	"os"
	"path/filepath"
	"runtime"
	"runtime/pprof"
)

func CPUProfile(fpath string) (closefn func()) {
	root, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	
	f, err := os.Create(filepath.Join(root, fpath))
	if err != nil {
		log.Fatal("could not create CPU profile: ", err)
	}

	if err := pprof.StartCPUProfile(f); err != nil {
		log.Fatal("could not start CPU profile: ", err)
	}

	return func() {
		defer f.Close()
		defer pprof.StopCPUProfile()
	}
}

func MEMProfile(fpath string) (closeFn func()) {
	root, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	f, err := os.Create(filepath.Join(root, fpath))
	if err != nil {
		log.Fatal("could not create CPU profile: ", err)
	}

	runtime.GC()
	if err := pprof.WriteHeapProfile(f); err != nil {
		log.Fatal("could not start CPU profile: ", err)
	}

	return func() {
		defer f.Close()
	}
}
