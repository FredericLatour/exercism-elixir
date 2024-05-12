defmodule Newsletter do
  def read_emails(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim/1)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.binwrite(pid, "#{email}\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    send_nl_loop(read_emails(emails_path), open_log(log_path), send_fun)
  end

  defp send_nl_loop(lst_emails, pid_log, send_fun) do
    case lst_emails do
      [] ->
        close_log(pid_log)

      [h | t] ->
        case send_fun.(h) do
          :ok ->
            log_sent_email(pid_log, h)
            send_nl_loop(t, pid_log, send_fun)

          _ ->
            send_nl_loop(t, pid_log, send_fun)
        end
    end
  end
end
