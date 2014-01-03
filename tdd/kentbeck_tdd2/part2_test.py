from part2 import WasRun, TestCase

test = WasRun("testMethod")
print test.wasRun
test.run()
print test.wasRun

class TestCaseTest(TestCase):
  def setUp(self):
    test = WasRun("testMethod")
  def testRunning(self):
    test.run()
    assert(test.wasRun)
  def testSetUp(self):
    test.run()
    assert(test.wasSetUp)
TestCaseTest("testRunning").run()
TestCaseTest("testSetUp").run()


