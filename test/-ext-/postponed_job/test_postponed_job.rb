require 'test/unit'
require 'thread'
require '-test-/postponed_job'

module Bug
  def self.postponed_job_call_direct_wrapper(*args)
    postponed_job_call_direct(*arg)
  end

  def self.postponed_job_register_wrapper(*args)
    postponed_job_register(*args)
  end
end

class TestTask < Test::Unit::TestCase
  def test_register
    direct, registered = [], []

    Bug.postponed_job_call_direct_wrapper(direct)
    Bug.postponed_job_register_wrapper(registered)

    assert_match     /postponed_job_call_direct_wrapper/, direct.join
    assert_not_match /postponed_job_register_wrapper/, registered.join
  end
end 