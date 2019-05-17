defmodule OverlappingIO do
  @type device :: atom | pid
  @type nodata :: {:error, term} | :eof
  @type chardata :: String.t() | maybe_improper_list(char | chardata, String.t() | [])

  # @spec getn(prompt | device, count | prompt) :: chardata | nodata
  #       when prompt: chardata | String.Chars.t(),
  #            count: pos_integer
  @spec getn(chardata() | String.Chars.t(), pos_integer()) :: chardata() | nodata()
  @spec getn(device(), chardata() | String.Chars.t()) :: chardata() | nodata()
  def getn(prompt_or_device, count_or_prompt) do
    IO.getn(prompt_or_device, count_or_prompt)
  end
end