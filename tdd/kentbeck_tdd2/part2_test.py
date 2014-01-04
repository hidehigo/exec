from part2 import WasRun, TestCase, TestResult

test = WasRun("testMethod")
print test.wasRun
test.run()
print test.wasRun

class TestCaseTest(TestCase):
  def testTemplateMethod(self):
    test = WasRun("testMethod")
    test.run()
    assert("setUp testMethod tearDown " == test.log)
  def testResult(self):
    test = WasRun("testMethod")
    result = test.run()
    assert("1 run, 0 failed" == result.summary())
  def testFailedResult(self):
    test = WasRun("testBrokenMethod")
    result = test.run()
    assert("1 run, 1 failed" == result.summary())
  def testFailedResultFormatting(self):
    result = TestResult()
    result.testStarted()
    result.testFailed()
    assert("1 run, 1 failed" == result.sammary())

TestCaseTest("testTemplateMethod").testResult()
#TestCaseTest("testBrokenMethod").testFailedResult()
TestCaseTest("hoge").testFailedResultFormatting()


