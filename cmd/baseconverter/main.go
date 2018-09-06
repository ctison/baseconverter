package main

//go:generate make -C ../../pkg/baseconverter_grpc generate

import (
	"fmt"
	// "log"

	"github.com/chtison/baseconverter"
	"github.com/chtison/baseconverter/cmd/baseconverter/serve"
	"github.com/spf13/cobra"
)

func main() {
	rootCmd := &cobra.Command{
	  Use: "baseconverter",
	  Short: "Baseconverter converts numbers in any base to any other base",
	  RunE: func(cmd *cobra.Command, args []string) error {
		  if len(args) != 3 {
			  cmd.Help()
			  return nil
		  }
		  result, e1, e2 := baseconverter.BaseToBase(args[0], args[1], args[2])
		  if e1 != nil {
			  return fmt.Errorf("Error: inBase: %v", e1)
		  }
		  if e2 != nil {
			  return fmt.Errorf("Error: toBase: %v", e2)
		  }
		  fmt.Println(result)
		  return nil
	  },
	}
	rootCmd.AddCommand(serve.Cmd)
	if err := rootCmd.Execute(); err != nil {
		// log.Fatal(err)
	}
}
