from part2 import WasRun, TestCase

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

TestCaseTest("testTemplateMethod").testResult()


