package serve

import (
	"context"
	"fmt"
	"log"
	"net"

	"github.com/spf13/cobra"
	"github.com/chtison/baseconverter"
	pb "github.com/chtison/baseconverter/pkg/baseconverter_grpc"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

var (
	Cmd = &cobra.Command{
		Use: "serve",
		Short: "Start a grpc server for base conversion",
		RunE: runE,
	}
	FlagAddress string
	FlagTLSCert string
	FlagTLSKey string
)

func init() {
	Cmd.Flags().StringVarP(&FlagAddress, "address", "a", ":51966", "The address the server will listen on")
	Cmd.Flags().StringVar(&FlagTLSCert, "tlscert", "", "Path to TLS certificate file")
	Cmd.Flags().StringVar(&FlagTLSKey, "tlskey", "", "Path to TLS key file")
}

func runE(cmd *cobra.Command, args []string) error {
	l, err := net.Listen("tcp", FlagAddress)
	if err != nil {
		return err
	}
	var sOpts []grpc.ServerOption
	if FlagTLSCert != "" || FlagTLSKey != "" {
		if FlagTLSCert == "" || FlagTLSKey == "" {
			return fmt.Errorf("--certfile and --keyfile are required together")
		}
		creds, err := credentials.NewServerTLSFromFile(FlagTLSCert, FlagTLSKey)
		if err != nil {
			return err
		}
		sOpts = append(sOpts, grpc.Creds(creds))
	}
	s := grpc.NewServer(sOpts...)
	pb.RegisterBaseConverterServiceServer(s, &baseConverterServiceServer{})
	log.Println(fmt.Sprintf("Listening on %s", FlagAddress))
	if err := s.Serve(l); err != nil {
		return err
	}
	return nil
}

type baseConverterServiceServer struct{}

func (s *baseConverterServiceServer) Convert(ctx context.Context, in *pb.BaseConverterRequest) (*pb.BaseConverterReply, error) {
	result, e1, e2 := baseconverter.BaseToBase(in.Number, in.InBase, in.ToBase)
	reply := &pb.BaseConverterReply{Result: result}
	if e1 != nil {
		reply.ErrorInBase = e1.Error()
	}
	if e2 != nil {
		reply.ErrorToBase = e2.Error()
	}
	return reply, nil
}
