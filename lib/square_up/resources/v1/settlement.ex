defmodule SquareUp.V1.Settlement do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec retrieve(
          SquareUp.Client.t(),
          %{required(:location_id) => binary(), required(:settlement_id) => binary()},
          %{},
          %{}
        ) :: SquareUp.Client.response(SquareUp.TypeSpecs.v1_settlement())
  def retrieve(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{location_id: spec(is_binary()), settlement_id: spec(is_binary())})
    params_spec = schema(%{})
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.v1_settlement/0}

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v1/{location_id}/settlements/{settlement_id}"
    })
  end
end
