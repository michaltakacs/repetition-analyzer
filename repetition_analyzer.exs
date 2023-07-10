defmodule RepetitionAnalyzer do
  def run_from_argv([file, stopwords_file, top_count_str]) do
    with {:ok, file} <- check_file_exists(file),
         {:ok, stopwords_file} <- check_file_exists(stopwords_file),
         {:ok, top_count} <- parse_top_count(top_count_str) do
      process_file(file, stopwords_file, top_count)
      |> IO.inspect()
    end
  end

  def run_from_argv(_) do
    IO.puts("Error: Incorrect number of arguments.")
  end
  
  def process_file(file, stopwords_file, top_count) do
    stop_words = get_stop_words_from_file(stopwords_file)
    File.stream!(file)
      |> Stream.flat_map(&String.split(&1, ~r/\s*[,.!:;?|]\s*|\s*-\s+|\s+/))
      |> Stream.map(&String.downcase/1)
      |> Stream.filter(&(not MapSet.member?(stop_words, &1)))
      |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end)
      |> Enum.sort_by(fn {_, v} -> -v end)
      |> Enum.take(top_count)
  end

  defp get_stop_words_from_file(file) do
    File.read!(file)
      |> String.split("\n")
      |> MapSet.new()
  end

  defp check_file_exists(file) do
    if File.exists?(file) do
      {:ok, file}
    else
      IO.puts("Error: The file #{file} does not exist.")
      :error
    end
  end

  defp parse_top_count(top_count_str) do
    case Integer.parse(top_count_str) do
      {top_count, _} -> {:ok, top_count}
      :error ->
        IO.puts("Error: The third argument must be an integer.")
        :error
    end
  end
end

# Run the analyzer with command line arguments
RepetitionAnalyzer.run_from_argv(System.argv())
