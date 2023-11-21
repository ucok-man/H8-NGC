package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"regexp"
	"sync"
)

// No Error handling in case error exit. and log.
func downloadFile(destinationDir, url string, wg *sync.WaitGroup) {
	defer wg.Done()

	// create dir if necessary
	err := os.MkdirAll(destinationDir, 0664)
	if err != nil {
		fmt.Fprintln(os.Stderr, "err: url - ", url, err)
		return
	}

	// Get the data
	resp, err := http.Get(url)
	if err != nil {
		fmt.Fprintln(os.Stderr, "err: url -", url, err)
		return
	}
	defer resp.Body.Close()

	// make out target file relative to destination dir
	outname := filepath.Base(url)
	outpath := filepath.Join(destinationDir, outname)

	// get file info to check file is exists
	finfo, err := os.Stat(outpath)
	if err != nil && !os.IsNotExist(err) {
		fmt.Fprintln(os.Stderr, "err: url -", url, err)
		return
	}

	// file already exists - add indexing to front of filename.
	if finfo != nil {
		listentry, err := os.ReadDir(destinationDir)
		if err != nil {
			fmt.Fprintln(os.Stderr, "err: url -", url, err)
			return
		}

		var count int
		for _, entry := range listentry {
			if entry.IsDir() {
				continue
			}

			match, err := regexp.MatchString(finfo.Name(), entry.Name())
			if err != nil {
				fmt.Fprintln(os.Stderr, "err: url -", url, err)
				return
			}

			if match {
				count++
			}
		}

		outname = fmt.Sprintf("(%v)_", count) + outname
		outpath = filepath.Join(destinationDir, outname)
	}

	// make out file
	out, err := os.Create(outpath)
	if err != nil {
		fmt.Fprintln(os.Stderr, "err: url -", url, err)
		return
	}
	defer out.Close()

	// Write the body to file
	_, err = io.Copy(out, resp.Body)
	if err != nil {
		fmt.Fprintln(os.Stderr, "err: url -", url, err)
		return
	}
	fmt.Println(outpath)
}

func main() {
	var wg sync.WaitGroup

	if len(os.Args[1:]) < 2 {
		fmt.Fprintln(os.Stderr, "usage: <destination dir> [url ...]")
		os.Exit(1)
	}

	if (os.Args[2]) == "-help" || (os.Args[2]) == "--help" {
		fmt.Fprintln(os.Stderr, "usage: <destination dir> [url ...]")
		os.Exit(1)
	}

	urls := os.Args[2:]
	for _, url := range urls {
		wg.Add(1)
		go downloadFile(os.Args[1], url, &wg)
	}

	wg.Wait()
	fmt.Println("Done!")
}

// https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4
