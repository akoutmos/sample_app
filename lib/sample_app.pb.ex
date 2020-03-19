defmodule SampleApp.UserReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          first_name: String.t(),
          last_name: String.t(),
          age: integer
        }
  defstruct [:id, :first_name, :last_name, :age]

  field :id, 1, type: :int32
  field :first_name, 2, type: :string
  field :last_name, 3, type: :string
  field :age, 4, type: :int32
end

defmodule SampleApp.CreateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          first_name: String.t(),
          last_name: String.t(),
          age: integer
        }
  defstruct [:first_name, :last_name, :age]

  field :first_name, 1, type: :string
  field :last_name, 2, type: :string
  field :age, 3, type: :int32
end

defmodule SampleApp.GetRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }
  defstruct [:id]

  field :id, 1, type: :int32
end

defmodule SampleApp.User.Service do
  @moduledoc false
  use GRPC.Service, name: "sample_app.User"

  rpc :Create, SampleApp.CreateRequest, SampleApp.UserReply
  rpc :Get, SampleApp.GetRequest, SampleApp.UserReply
end

defmodule SampleApp.User.Stub do
  @moduledoc false
  use GRPC.Stub, service: SampleApp.User.Service
end
