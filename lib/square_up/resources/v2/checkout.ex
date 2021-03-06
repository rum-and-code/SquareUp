defmodule SquareUp.V2.Checkout do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec create(
          SquareUp.Client.t(),
          %{required(:location_id) => binary()},
          SquareUp.TypeSpecs.create_checkout_request(),
          %{}
        ) :: SquareUp.Client.response(SquareUp.TypeSpecs.create_checkout_response())
  def create(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{location_id: spec(is_binary())})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.create_checkout_request/0)
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.create_checkout_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/locations/{location_id}/checkouts"
    })
  end
end
