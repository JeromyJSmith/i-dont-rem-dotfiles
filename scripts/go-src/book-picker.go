// This program provides a randomized selection of a line from a text file.
// It will continue to provide new suggestions whenever 'ENTER' is pressed,
// up until 'q' is input.  It ignores empty lines.

package main


import (
    "fmt"
    "bufio"
    "os"
    "math/rand"
    "time"
)


func get_book_list(filename string) []string {
    var books []string

    file, err := os.Open(filename)
    if err != nil {
        fmt.Printf("Error opening %s...", filename)
        os.Exit(1)
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        books = append(books, scanner.Text())
    }
    if scanner.Err() != nil {
        fmt.Printf("Issue reading in items from %s...", filename)
        os.Exit(1)
    }

    return books
}


func check_input(input string) {
    if input == "q" {
        os.Exit(0)
    }
}


func get_random_index(length int) int {
    return rand.Intn(length)
}


func choose_and_display_book(book_list []string) {
    index := get_random_index(len(book_list))
    book := book_list[index]
    if book == "" {
        choose_and_display_book(book_list)
    } else {
        fmt.Printf("-> %s\n", book)
    }
}


func main() {
    if len(os.Args) != 2 {
        fmt.Println("Need a filename to run...")
        os.Exit(1)
    }

    filename := os.Args[1]
    rand.Seed(time.Now().UTC().UnixNano())
    message :=
`
Fetch Random Book from List
---------------------------
Press 'q' to quit, anything
else to run it again
--------------------------
`

    fmt.Print(message)
    scanner := bufio.NewScanner(os.Stdin)

    book_list := get_book_list(filename)

    choose_and_display_book(book_list)

    for scanner.Scan() {
        input := scanner.Text()
        check_input(input)
        choose_and_display_book(book_list)
    }
    if scanner.Err() != nil {
        fmt.Println("Error reading input")
    }
}
