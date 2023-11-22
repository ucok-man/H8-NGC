package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
	"sync"
)

func countWord(fname string) int {
	content, err := os.ReadFile(fname)
	if err != nil {
		fmt.Printf("error %s: %v\n", fname, err)
		return -1
	}

	contents := strings.Split(string(content), " ")
	return len(contents)
}

func main() {
	root, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	// sample input filename
	files := []string{
		filepath.Join(root, "05-concurrent-word-count/sample/file1.txt"),
		filepath.Join(root, "05-concurrent-word-count/sample/file2.txt"),
		filepath.Join(root, "05-concurrent-word-count/sample/file3.txt"),
	}

	var wg sync.WaitGroup
	wg.Add(len(files))

	wordcount := make(map[string]int)
	for _, filename := range files {
		go func(fname string) {
			defer wg.Done()
			count := countWord(fname)
			wordcount[filepath.Base(fname)] = count
		}(filename)
	}

	wg.Wait()

	// display
	for fname, count := range wordcount {
		fmt.Printf("%s: %d words\n", fname, count)
	}
}
