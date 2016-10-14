class FakeExecutor
  attr_reader :exec_calls, :system_calls

  def initialize
    @exec_calls = []
    @system_calls = []
  end

  def system(cmd)
    @system_calls << cmd
  end

  def exec(cmd)
    @exec_calls << cmd
  end

  def system_called_times
    @system_calls.count
  end

  def exec_called_times
    @exec_calls.count
  end
end
