defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.
  lss: I didnt need the case, the implem without checking for empty list worked anyway

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer

  def count(strand, nucleotide) do
    case strand do
      [] -> 0
      _ ->
        instances = Enum.filter(strand, fn(x) -> x == nucleotide end) 
        length(instances)
    end
    
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  lss: taking my cue from valim himself, http://stackoverflow.com/questions/29924170/elixir-looping-through-and-adding-to-map

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce([?A, ?T, ?C, ?G], %{}, fn x, acc ->
      Map.put(acc, x, count(strand, x)) end)
  end
end
