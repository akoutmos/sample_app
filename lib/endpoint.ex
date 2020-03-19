defmodule SampleApp.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(SampleApp.User.Server)
end
