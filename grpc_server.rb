require 'grpc'
require "anycable"

require_relative 'app/rpc/anycable_rpc_service'

class GRPCServer
  def self.start
    server = GRPC::RpcServer.new
    server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
    server.handle(AnyCableRpcService.new)
    server.run_till_terminated
  end
end

