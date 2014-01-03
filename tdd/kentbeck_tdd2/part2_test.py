from part2 import WasRun, TestCase

test = WasRun("testMethod")
print test.wasRun
test.run()
print test.wasRun

class TestCaseTest(TestCase):
  def testRunning(self):
    test = WasRun("testMethod")
    assert(not test.wasRun)
    test.run()
    assert(test.wasRun)
  def testSetUp(self):
    test = WasRun("testMethod")
    test.run()
    assert(test.wasSetUp)
TestCaseTest("testRunning").run()
TestCaseTest("testSetUp").run()


