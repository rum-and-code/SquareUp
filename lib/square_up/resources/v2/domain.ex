defmodule SquareUp.V2.Domain do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec register(SquareUp.Client.t(), %{}, SquareUp.TypeSpecs.register_domain_request(), %{}) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.register_domain_response())
  def register(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.register_domain_request/0)
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.register_domain_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/apple-pay/domains"
    })
  end
end
